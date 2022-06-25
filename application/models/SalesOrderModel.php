<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class SalesOrderModel extends CI_Model  {

    public function __construct()
    {
        parent::__construct();
        $this->table = 'rlm_data';
        $this->load->library('CSVReader');
        $this->load->library('csvimport');
    }

    public function import_data(){
        set_time_limit(0);
        ini_set('memory_limit', '20000M');
        $tabledata ='';
        $transaction_level_data = [];
        $transaction_level_file = [];
        $transaction_level_errors = [];
        $transaction_headers = [];
        $openOrderArr = [];
        $bulkinsertPeriod_arr = [];
        $saleOrderArr = [];
        $import_date = date('Ymd',strtotime('Last Monday'));
        if(date('D') == "Mon") $import_date = date('Ymd');
        $file='salesorder.csv';
        if (file_exists(FCPATH . '../../../dump_order_sheets/'.$file)) {
            
            $oracle_transaction_file = fopen(FCPATH . '../../../dump_order_sheets/'.$file, "r");
            $skip = 0;
            while(! feof($oracle_transaction_file))
            {
                $transaction_level_file[] = fgetcsv($oracle_transaction_file);
            }
            fclose($oracle_transaction_file);
        }
        else
        {
            array_push($transaction_level_errors, 'File does not exists');
        }
        $tabledata.="<tr><td><h2>Import Release Result</h2></td></tr>";
        if(count($transaction_level_errors)>0)
        {
            $tabledata.="<tr><td><h3>Errors:</h3> <ol><li>File not found</li></ol></td></tr>";
        }else{
            foreach($transaction_level_file as $key => $row){
                if($row[0]=='')
                    continue; 
                if($key == 0){
                    $transaction_headers = $row;
                }
                else{
                    $transaction_level_data[] = $row;
                }
            }
           
            $totalRowCount = 0;
            foreach($transaction_level_data as $key=>$val){
                $customerName = $val[0];
                $account_num = $val[1];
                $part_num = $val[2];
                $office = $val[3];
                $index = 4;
                $nextYear = date('y');
                $nextYearCount=0;
                foreach($transaction_headers as $key1){
                    if($key1=='Customer Name' || $key1=='Account #' || $key1=='Item#'  || $key1=='Office')
                    continue;
                    $format = 'dm'.$nextYear;
                    $dateFormat = date($format,strtotime($key1));
                    if($dateFormat=='01011970' || $dateFormat=='19700101')
                    continue;
                    $getMonth = date('m',strtotime($key1));
                    if($getMonth == '12'){
                        if($nextYearCount>0){
                            $nextYear = date('y', strtotime('+2 year'));
                        }else{
                            $nextYear = date('y', strtotime('+1 year'));
                        }
                        $nextYearCount++;
                    }
                    $importDate = date('Ymd');
                    $saleOrderArr = array(
                        'customer_name' =>  $customerName,
                        'account_num' =>  $account_num,
                        'part_num' =>  $part_num,
                        'office' =>  $office,
                        'period' => $dateFormat,
                        'value' =>  $val[$index],
                        'import_date' =>  $importDate,
                    );
                    array_push($bulkinsertPeriod_arr,$saleOrderArr);
                    $index++;
                }
                $totalRowCount++;
            }
			
			$this->db->query('UPDATE sales_order SET status=0');
            $this->db->insert_batch('sales_order', $bulkinsertPeriod_arr);
            $saleActivityLog = array(
                'activity_date' =>  date('Y-m-d'),
                'file_name' =>  $file,
                'file_type' =>  'Sales Plan',
                'activity_status' =>  'Success',
                'message' => "$totalRowCount rows inserted",
            );
            $this->db->insert('activity_log', $saleActivityLog);
            $tabledata.="<tr><td><h3>Success:</h3> <p>".$totalRowCount." rows added successfully</p></td></tr>";
            return $tabledata;

            
        }
    }

    public function get_sale_orders($account_id,$part_number,$due_date){
        $this->db->select('value');
		$this->db->where('status',1);
        $this->db->where('account_num',$account_id);
        $this->db->where('part_num',$part_number);
        $this->db->where('period',$due_date);
        $this->db->from('sales_order');
        $query = $this->db->get();
        $result = $query->result_array();
        if($result)
            return $result[0]['value'];
        else
            return '-';
    }

    public function get_total_sale_orders($due_date){
        $this->db->select_sum('value');
		$this->db->where('status',1);
        $this->db->where('period',$due_date);
        $this->db->from('sales_order');
        $query = $this->db->get();
        $result = $query->result_array();
        if($result)
            return $result[0]['value'];
        else
            return '-';
    }

    
}