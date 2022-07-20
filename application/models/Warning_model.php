<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Warning_model extends CI_Model  {

    public function __construct()
    {
        parent::__construct();
        $this->table = 'warning';
    }

    public function get_warnings(){
        try{
        $this->db->select('*');
        $this->db->from($this->table);
        $query = $this->db->get();
        $data = $query->result_array();
        return $data;
        }
        //catch exception
        catch(Exception $e) {
            echo 'Message: ' .$e->getMessage();
            exit;
        }
    }

    public function get_already_exist_warning($account_id,$part_number,$due_date,$total_qty,$saleOrderQty){
        try{
        $this->db->select('*');
        $this->db->from('warning_log');
        $this->db->where('account_number',$account_id);
        $this->db->where('part_num',$part_number);
        $this->db->where('due_date',$due_date);
        $this->db->where('open_order_qty',$total_qty);
        $this->db->where('sales_plan_qty',$saleOrderQty);
        $this->db->order_by('status','Open');
        $query = $this->db->get();
        $data = $query->result_array();
        return $data;
        }
        //catch exception
        catch(Exception $e) {
            echo 'Message: ' .$e->getMessage();
            exit;
        }   
    } 

    public function get_global_already_exist_warning($type,$due_date,$part_num,$total_qty,$saleOrderQty){
        try{
            $this->db->select('*');
            $this->db->from('warning_log');
            $this->db->where('warning',$type);
            $this->db->where('due_date',$due_date);
            $this->db->where('part_num',$part_num);
            $this->db->where('open_order_qty',$total_qty);
            $this->db->where('sales_plan_qty',$saleOrderQty);
           
            $this->db->order_by('status','Open');
            $query = $this->db->get();
            $data = $query->result_array();
            return $data;
        }
        //catch exception
        catch(Exception $e) {
            echo 'Message: ' .$e->getMessage();
            exit;
        }   
    } 

    public function get_warning_logs(){
        try{
        $this->db->select('*');
        $this->db->from('warning_log');
        $this->db->order_by('id','DESC');
        $this->db->order_by('status','Open');
        $query = $this->db->get();
        $data = $query->result_array();
        return $data;
        }
        //catch exception
        catch(Exception $e) {
            echo 'Message: ' .$e->getMessage();
            exit;
        }   
    } 

    public function get_threshold($id){
      try{
        $this->db->select('threshold');
        $this->db->from($this->table);
        $this->db->where('id',$id);
        $query = $this->db->get();
        $data = $query->result_array();
        return $data[0]['threshold'];
        }
        catch(Exception $e) {
            echo 'Message: ' .$e->getMessage();
            exit;
        }  
    }

    public function get_tolerance_by_customer($id){
        try{
          $this->db->select('threshold');
          $this->db->from($this->table);
          $this->db->where('customer_num',$id);
          $query = $this->db->get();
          $data = $query->result_array();
          return $data;
          }
          catch(Exception $e) {
              echo 'Message: ' .$e->getMessage();
              exit;
          }  
      }

    public function get_warning_contacts(){
        try{
        $this->db->select('*');
        $this->db->from('contact_book');
        $query = $this->db->get();
        $data = $query->result_array();
        return $data;
        }
        //catch exception
        catch(Exception $e) {
            echo 'Message: ' .$e->getMessage();
            exit;
        }
    }

    public function get_warning_formulas(){
        try{
        $this->db->select('*');
        $this->db->from('condition_list');
        $query = $this->db->get();
        $data = $query->result_array();
        return $data;
        }
        //catch exception
        catch(Exception $e) {
            echo 'Message: ' .$e->getMessage();
            exit;
        }
    }

    public function update_warning_contact($warning_arr,$id){
        $this->db->where('id', $id);
        $this->db->update('contact_book', $warning_arr);
        if ($this->db->affected_rows() > 0) {
            return true;
        }
        return false;
    }

    public function update_warning_condition($warning_arr,$id){
        $this->db->where('id', $id);
        $this->db->update('condition_list', $warning_arr);
        if ($this->db->affected_rows() > 0) {
            return true;
        }
        return false;
    }

    public function update_warnings($warning_arr,$id){
        $this->db->where('id', $id);
        $this->db->update($this->table, $warning_arr);
        if ($this->db->affected_rows() > 0) {
            return true;
        }
        return false;
    }

    public function update_warninglog($warning_arr,$id){
        $this->db->where('id', $id);
        $this->db->update('warning_log', $warning_arr);
        if ($this->db->affected_rows() > 0) {
            return true;
        }
        return false;
    }

    public function create_warning($data){
        $this->db->insert('warning_log',$data);
        if ($this->db->affected_rows() > 0) {
            return true;
        }
        return false;
    }
}