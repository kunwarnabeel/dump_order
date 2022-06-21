<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class UnplannedOrdersModel extends CI_Model  {

    public function __construct()
    {
        parent::__construct();
        $this->table = 'unplanned_orders';
        $this->load->library('CSVReader');
        $this->load->library('csvimport');
    }

    public function create_unplanned_orders($data){
        $this->db->insert('unplanned_orders',$data);
        if ($this->db->affected_rows() > 0) {
            return true;
        }
        return false;
    }

    public function get_unplanned_orders(){
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
}