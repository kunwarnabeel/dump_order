<?php

if (!defined('BASEPATH')) {
  exit('No direct script access allowed');
}

class Warnings extends MY_Controller
{
  public function __construct()
  {
    parent::__construct();
   //  if(!$this->user)
   //  {
   //   redirect('login');
   // }
   $this->load->model('Warning_model');
 }

 public function index(){
  $warning_list = $this->Warning_model->get_warnings();
  $this->view_data['warnings'] = $warning_list;     
  $this->view_data['form_action'] = 'warnings/update';     
    $this->content_view = 'mymodules/warnings';
 }
 public function warning_log(){
  $warning_list = $this->Warning_model->get_warning_logs();
  $this->view_data['warnings'] = $warning_list;     
  $this->view_data['form_action'] = 'warnings/update_log';     
    $this->content_view = 'mymodules/warning_log';
 }
 public function update(){
  if($_POST['send']=='Delete'){
    $deleteId = $_POST['id'];
    $this->db->query("delete from warning where id=$deleteId");
    redirect('warnings');
  }
  if($_POST['send']=='Add Row'){
    $this->db->query("INSERT INTO warning (type,customer_num,threshold) VALUES('Customer specific setting','','')");
    redirect('warnings');
  }
  $result = false;
  $mapping = array(
    'threshold'=>$_POST['threshold'],
    'customer_num'=>$_POST['customer_num'],
    'updated_date'=> date('Ymd')
      );
  $result = $this->Warning_model->update_warnings($mapping,$_POST['id']);
  if($result)
        {
            $this->session->set_flashdata('message', 'success: Warnings updated successfully.');
        
        } else {
            $this->session->set_flashdata('message', 'error: Something went wrong');
        }
        redirect('warnings');
 }

 public function update_log(){
  // print_r($_POST);exit;
  $result = false;
  $mapping = array(
    'user_notes'=>$_POST['user_notes'],
    'status'=> $_POST['status']
      );
  $result = $this->Warning_model->update_warninglog($mapping,$_POST['id']);
  if($result)
        {
            $this->session->set_flashdata('message', 'success: Warnings updated successfully.');
        
        } else {
            $this->session->set_flashdata('message', 'error: Something went wrong');
        }
        redirect('warnings/warning_log');
 }

 public function export_all(){
  $this->db->select('log_date,release_date,release_num,customer_num,customer_name,plant_num,part_num,sws_part_num,warning,delta,user_note,status');
$this->db->from('warning_log');
$this->db->order_by('id','DESC');
$query = $this->db->get();
$items = $query->result_array();

$filename = "Warning_log_".date('m-d-Y').".csv";
  header("Content-Description: File Transfer");
  header("Content-Disposition: attachment; filename=$filename");
  header("Content-Type: application/csv; ");

  // file creation
  $file = fopen('php://output', 'w');
  $header = array('Log Date', 'Release Date', 'Release Number', 'Customer_Number','Customer Name','Plant Number','Part Number','SWS Part Number','Warning','Delta','User Note', 'Status');
  fputcsv($file, str_replace('"', '', $header));
  foreach ($items as $key=>$line){
      fputcsv($file, $line);
  }
  fclose($file);
  exit;
}
}