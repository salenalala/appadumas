<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class crud_judul extends CI_Controller {
    function __construct(){
        parent::__construct();
        $this->load->model('judul_model');
    }
    public function tambah(){

       
		$this->form_validation->set_rules('judul','judul','required|trim');
		

		if( $this->form_validation->run() == false){
            redirect('dashboard/judul');		
		}else{
			$data = [
				
                               
                                'judul' => htmlspecialchars( $this->input->post('judul',true)),
			];

			$this->db->insert('judul',$data);
			redirect('dashboard/judul');
            // var_dump($data);
		}

    }
    public function edit() {
        
        $id_judul =    $this->input->post('id_judul',true);
        $judul =    $this->input->post('judul',true);
       
        

        $data = array(
            'id_judul' => $id_judul,
            'judul' => $judul
            
            
        );
            $this->db->where('id_judul',$id_judul);
            $this->db->update('judul', $data);
            redirect('dashboard/judul');
        // var_dump($data);
    }
    public function delete($id) {
        $this->load->model('user_model');
        $affected_rows = $this->judul_model->delete($id);
        redirect('dashboard/judul');
    }

}