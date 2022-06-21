<?php

if (!defined('BASEPATH')) {
  exit('No direct script access allowed');
}

class UnplannedOrders extends MY_Controller
{
  public function __construct()
  {
    parent::__construct();
   //  if(!$this->user)
   //  {
   //   redirect('login');
   // }
   $this->load->model('UnplannedOrdersModel');
 }

 public function index(){
  $UnplannedOrdersList = $this->UnplannedOrdersModel->get_unplanned_orders();
  $this->view_data['unplannedorders'] = $UnplannedOrdersList;        
    $this->content_view = 'mymodules/unplannedorders';
 }
}