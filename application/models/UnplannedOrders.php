<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class UnplannedOrders extends CI_Model  {

    public function __construct()
    {
        parent::__construct();
        $this->table = 'unplanned_orders';
        $this->load->library('CSVReader');
        $this->load->library('csvimport');
        $this->load->model('Mapping_model');
    }

    public function create_unplanned_orders($data){
        $this->db->insert('unplanned_orders',$data);
        if ($this->db->affected_rows() > 0) {
            return true;
        }
        return false;
    }
}