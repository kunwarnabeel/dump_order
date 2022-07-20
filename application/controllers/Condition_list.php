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
  $result = false;
  if(empty($_POST['formula_value'])){
    $this->session->set_flashdata('message', 'error: formula field can not be empty');
    redirect('condition_list');
  }
  $formula_value = $_POST['formula_value'].','.$_POST['formula_value'];
  $mapping = array(
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
