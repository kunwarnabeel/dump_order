<?php
/**
 * User: Maaz Uddin 
 * Description : This controller is being used to validate and import Oracle datasheets
 */

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class SalesOrder extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->library('CSVReader');
        $this->load->library('csvimport');
        //$this->load->helper('customstring');
        $this->load->model('SalesOrderModel');
        $this->load->model('Warning_model');
    }

    public function index(){
        print_r('please add import_data in the url');exit;
    }
    public function import_data(){
        $tabledata ='';
        $tabledata = $this->SalesOrderModel->import_data();
        echo $tabledata;
        exit();
    }
    
}