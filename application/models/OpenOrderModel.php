<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class OpenOrderModel extends CI_Model  {

    public function __construct()
    {
        parent::__construct();
        $this->table = 'rlm_data';
        $this->load->library('CSVReader');
        $this->load->library('csvimport');
        $this->load->model('Mapping_model');
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
        $bulkinsert_arr = [];
        $openOrderArr = [];
        $import_date = date('Ymd',strtotime('Last Monday'));
        if(date('D') == "Mon") $import_date = date('Ymd');
        $file='dumpopenorders.csv';
        if (file_exists(FCPATH . '../../../rlm_sheets/'.$file)) {
            
            $oracle_transaction_file = fopen(FCPATH . '../../../rlm_sheets/'.$file, "r");
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
                if($key == 0)
                    continue;
                if($row[0]=='' || $row[2]=='' || $row[4]=='' || $row[6]=='' || $row[7]=='')
                    continue;
                $firstDate =  trim(date('Ymd',strtotime($row[0])));
                $dueDate =  trim(date('Ym',strtotime($row[6])));
                $openOrderArr = array(
                    'date' => $firstDate,
                    'org_id' => trim($row[1]),
                    'name' => trim($row[2]),
                    'account_id' => trim($row[3]),
                    'part_number' => trim($row[4]),
                    'description' => trim($row[5]),
                    'due_date' => $dueDate,
                    'total_qty' => trim($row[7]),
                );
                
                array_push($bulkinsert_arr,$openOrderArr);
            }

          //$this->db->insert_batch('open_orders', $bulkinsert_arr);
            
        }
    }

    public function get_distinct_duedate(){
        $this->db->select('due_date');
        $this->db->where('status',1);
        $this->db->distinct();
        $this->db->from('open_orders');
        $query = $this->db->get();
        $result = $query->result_array();
        return $result;
    }
    
    public function get_open_orders(){
        $this->db->select('name,org_id,date,account_id,part_number,due_date,total_qty,description');
        $this->db->where('status',1);
        $this->db->from('open_orders');
        $query = $this->db->get();
        $result = $query->result_array();
        return $result;
    }

    public function get_total_open_orders($due_date){
        $this->db->select_sum('total_qty');
        $this->db->where('due_date',$due_date);
        $this->db->from('open_orders');
        $query = $this->db->get();
        $result = $query->result_array();
        if($result)
            return $result[0]['total_qty'];
        else
            return '-';
    }

   

    
}