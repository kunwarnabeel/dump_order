<?php
/**
 * User: Maaz Uddin 
 * Description : This controller is being used to validate and import Oracle datasheets
 */

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class OpenOrder extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->library('CSVReader');
        $this->load->library('csvimport');
        //$this->load->helper('customstring');
        $this->load->model('OpenOrderModel');
        $this->load->model('SalesOrderModel');
        $this->load->model('UnplannedOrdersModel');
        $this->load->model('Warning_model');

    }

    public function index(){
        print_r('please add import_data in the url');exit;
    }
    public function import_data(){
        $tabledata ='';
        $tabledata = $this->OpenOrderModel->import_data();
        $this->generate_warning();
    }

    public function generate_warning(){
        $openOrder = $this->OpenOrderModel->get_open_orders();
        $customerLevelWarningCount=0;
        $GlobalLevelWarningCount=0;
        foreach ($openOrder as $key => $value) {
            $name = $value['name'];
            $account_id = $value['account_id'];
            $part_number = $value['part_number'];
            $due_date = $value['due_date'];
            $total_qty = $value['total_qty'];
            $org_id = $value['org_id'];
            $date = $value['date'];
            $description = $value['description'];

            // find account exsist in tolerance setup if exsist get that particular aacount settings otherwise get default settings for all customers
            ## Tolerance setting code ##

            $toleranceArr = $this->Warning_model->get_tolerance_by_customer($account_id);
            if(count($toleranceArr)>0){
                $threshold = $toleranceArr[0]['threshold'];
            }else{
                $toleranceArr = $this->Warning_model->get_tolerance_by_customer('All Customers');
                $threshold = $toleranceArr[0]['threshold'];
            }

            // Customer Item Level Warning
            $saleOrderQty = $this->SalesOrderModel->get_sale_orders($account_id,$part_number,$due_date);
            if($saleOrderQty!='-' && $saleOrderQty!='' && $saleOrderQty!=NULL){
                $saleOrderQtyThresold = $saleOrderQty*$threshold;
                if($total_qty>$saleOrderQtyThresold){
                    ## Check warning already exist if exist warning status 
                    $warningExist = $this->Warning_model->get_already_exist_warning($account_id,$part_number,$due_date,$total_qty,$saleOrderQty);
                    if(count($warningExist)>0){
                        continue;
                    }
                    ## Log warning on this item customer date code
                    $currentDate = date('Ymd');
                    $warningLogArr = array(
                        'log_date' => $currentDate,
                        'due_date' => $due_date,
                        'customer_name' => $name,
                        'account_number' => $account_id, 
                        'part_num' => $part_number, 
                        'warning' => 'Customer Item Level', 
                        'tolerance' => $threshold, 
                        'open_order_qty' => $total_qty,
                        'sales_plan_qty' => $saleOrderQty,
                        'description' => $description,
                    );
                    $this->Warning_model->create_warning($warningLogArr);
                    $customerLevelWarningCount++;     

                    ## email to concern person code 
                }
            }else{
                // find part then in sales orders if part number not found in sale order log in Unplanned Orders & continue the line
                ## Unplanned order code #
                $unplannedOrderArr = array(
                    'date' => $date,
                    'org_id' => $org_id,
                    'name' => $name,
                    'account_id' => $account_id, 
                    'part_number' => $part_number, 
                    'description' => $description, 
                    'due_date' => $due_date, 
                    'total_qty' => $total_qty,
                );
                $this->UnplannedOrdersModel->create_unplanned_orders($unplannedOrderArr);  
            }
        }

         // Global Level Warning
         $toleranceArr = $this->Warning_model->get_tolerance_by_customer('All Customers');
         $threshold = $toleranceArr[0]['threshold'];
         $dueDates = $this->OpenOrderModel->get_distinct_duedate();
         foreach($dueDates as $key=>$val){
            $valDueDate = $val['due_date'];
            $totalSaleOrder = $this->SalesOrderModel->get_total_sale_orders($val['due_date']);
            $totalOpenOrder = $this->OpenOrderModel->get_total_open_orders($val['due_date']);
            if($totalSaleOrder!='-' && $totalSaleOrder!='' && $totalSaleOrder!=NULL){
               $totalSaleOrderThreshold =  $threshold*$totalSaleOrder;
                if($totalOpenOrder>$totalSaleOrderThreshold){
                    ## Check warning already exist if exist warning status
                    // exit();
                    $warningExist = $this->Warning_model->get_global_already_exist_warning('Global Level',$valDueDate,$totalOpenOrder,$totalSaleOrder);
                    if(count($warningExist)>0){
                        continue;
                    } 

                    ## Log warning on this item customer date code
                    $currentDate = date('Ymd');
                    $warningLogArr = array(
                        'log_date' => $currentDate,
                        'due_date' => $val['due_date'],
                        'warning' => 'Global Level', 
                        'tolerance' => $threshold, 
                        'open_order_qty' => $totalOpenOrder,
                        'sales_plan_qty' => $totalSaleOrder,
                    );
                    $this->Warning_model->create_warning($warningLogArr);
                    $GlobalLevelWarningCount++;

                    ## email to concern person code 
                }
            }else{
                continue;
            }
        }
        $tabledata="";
        $tabledata.="<h3>Warnings:</h3>";
        if($customerLevelWarningCount){            
            $tabledata.="<li> ".$customerLevelWarningCount." Customer Item Level Warnings found. Details are available in the warning log.</li>";                

        }else{
            $tabledata.="<li> No Customer Item Level Warnings found on ".date("m-d-Y"). " </li>"; 
        }
        
        if($GlobalLevelWarningCount){            
            $tabledata.="<li> ".$GlobalLevelWarningCount." Global Level Warnings found. Details are available in the warning log.</li>";                

        }else{
            $tabledata.="<li>No Global Level Warnings found on ".date("m-d-Y"). " </li>"; 
        }

        // $this->load->library('parser');
        // $this->load->helper('file');
        // $data['core_settings'] = Setting::first();
        // $this->email->from($data['core_settings']->email, $data['core_settings']->company);
        // $this->email->to('s.reeder@us.sws.co.jp');
        // $this->email->cc('kazimmuhammad10@gmail.com');
        // // $this->email->cc('maazuddinsheikh@gmail.com');
        // $this->email->subject('SWS-USA Weekly Warning Alert');
        // $emailLogo="https://extswsrfq.swsusainc.com:4433/assets/blueline/images/sws-logo-email.png";
        // $parse_data = [
        //     'link' => base_url() . 'login/',
        //     'company' =>$data['core_settings']->company,
        //     'table_data' =>$tabledata,
        //     'logo' => '<img src="' . $emailLogo . '" alt="' . $data['core_settings']->company . '"/>',
        //     'invoice_logo' => '<img src="' . $emailLogo . '" alt="' . $data['core_settings']->company . '"/>'
        // ];
        // $email = read_file('./application/views/' . $data['core_settings']->template . '/templates/email_weekly_warning.html');
        // $message = $this->parser->parse_string($email, $parse_data);
        // $this->email->message($message);
        // $r =   $this->email->send();
        print_r($tabledata);
        exit();
    }

}