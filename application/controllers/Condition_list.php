<?php

if (!defined('BASEPATH')) {
  exit('No direct script access allowed');
}

class Condition_list extends MY_Controller
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
  $warning_list = $this->Warning_model->get_warning_formulas();
  $this->view_data['warning_condition'] = $warning_list;     
  $this->view_data['form_action'] = 'condition_list/update';     
    $this->content_view = 'mymodules/condition_list';
 }
 public function update(){
  //print_r($_POST); exit();
  if($_POST['send']=='Delete'){
    $deleteId = $_POST['id'];
    $this->db->query("delete from condition_list where id=$deleteId");
    redirect('condition_list');
  }
  if($_POST['send']=='Add Row'){
    $this->db->query("INSERT INTO condition_list (formula_name,formula_value) VALUES('','')");
    redirect('condition_list');
  }
  $result = false;
  if(empty($_POST['formula_value'])){
    $this->session->set_flashdata('message', 'error: formula field can not be empty');
    redirect('condition_list');
  }
  if(empty($_POST['formula_name'])){
    $this->session->set_flashdata('message', 'error: warning field can not be empty');
    redirect('condition_list');
  }
  $formula_value = $_POST['formula_value'];
  $formula_name = $_POST['formula_name'];
  $mapping = array(
    'formula_name'=> $formula_name,
    'formula_value'=> $formula_value,
    'updated_date'=> date('Ymd')
      );
  $result = $this->Warning_model->update_warning_condition($mapping,$_POST['id']);
  if($result)
        {
            $this->session->set_flashdata('message', 'success: Condition List updated successfully.');
        
        } else {
            $this->session->set_flashdata('message', 'error: Something went wrong');
        }
        redirect('condition_list');
 }
}
