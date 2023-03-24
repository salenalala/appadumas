<?php
class judul_model extends CI_Model {
    public function get_all_data()
    {
        
        $query = $this->db->get('judul');
        return $query;
                    
       
    }
    public function get_user($username) {
        $this->db->select('*');
        $this->db->from('masyarakat');
        $this->db->join('roles', 'roles.id = masyarakat.role_id');
        $this->db->where('username', $username);
        return $this->db->get()->row();
    }
    public function get_data()
    {
        $query = $this->db->get('judul');
        return $query->result();
    }
    public function update($id, $data) {
        $this->db->where('id_judul', $id);
        $this->db->update('judul', $data);
        return $this->db->affected_rows();
    }
    public function delete($id) {
        $this->db->where('id_judul', $id);
        $this->db->delete('judul');
        return $this->db->affected_rows();
    }
}

?>
