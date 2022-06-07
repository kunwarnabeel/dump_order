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
        $this->load->model('Warning_model');
        $this->load->model('Mapping_model');

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
        foreach ($openOrder as $key => $value) {
            $name = $value['name'];
            $account_id = $value['account_id'];
            $part_number = $value['part_number'];
            $due_date = $value['due_date'];
            $total_qty = $value['total_qty'];

            // find account exsist in tolerance setup if exsist get that particular aacount settings otherwise get default settings for all customers
            ## Tolerance setting code ##

            // find part then in sales orders if part number not found in sale order log in Unplanned Orders & continue the line
            ## Unplanned order code #

            // Customer Item Level Warning
            $saleOrderQty = $this->SalesOrderModel->get_sale_orders($account_id,$part_number,$due_date);
            if($saleOrderQty!='-'){
                if($total_qty>$saleOrderQty){
                    ## Check warning already exist if exist warning status 

                    ## Log warning on this item customer date code
                    $currentDate = date('Ymd');
                    $warningLogArr = array(
                        'log_date' => $currentDate,
                        'due_date' => $due_date
                        'customer_name' => $name,
                        'account_number' => $account_id, 
                        'part_num' => $part_number, 
                        'warning' => 'Customer Item Level', 
                        'tolerance' => 0, 
                        'open_order_qty' => $total_qty,
                        'sales_plan_qty' => $saleOrderQty,
                    );
                    $this->Warning_model->create_warning($warningLogArr);     

                    ## email to concern person code 
                }
            }
        }

         // Global Level Warning
        $dueDates = $this->OpenOrderModel->get_distinct_duedate();
         foreach($dueDates as $key=>$val){
            $totalSaleOrder = $this->SalesOrderModel->get_total_sale_orders($val['due_date']);
           // echo $val['due_date'].' --- '.$totalSaleOrder." totalSaleOrder --- ";
            $totalOpenOrder = $this->OpenOrderModel->get_total_open_orders($val['due_date']);
           //echo $totalOpenOrder." totalOpenOrder <br/>";
            if($totalSaleOrder!='-'){
                if($totalOpenOrder>$totalSaleOrder){
                    echo "Warning $totalOpenOrder is greater then $totalSaleOrder <br/>"; 
                    ## Check warning already exist if exist warning status 

                    ## Log warning on this item customer date code

                    $currentDate = date('Ymd');
                    $warningLogArr = array(
                        'log_date' => $currentDate,
                        'due_date' => $val['due_date'],
                        'warning' => 'Global Level', 
                        'tolerance' => 0, 
                        'open_order_qty' => $totalOpenOrder,
                        'sales_plan_qty' => $totalSaleOrder,
                    );
                    $this->Warning_model->create_warning($warningLogArr);

                    ## email to concern person code 
                }
            }
        }
        exit();
    }

}