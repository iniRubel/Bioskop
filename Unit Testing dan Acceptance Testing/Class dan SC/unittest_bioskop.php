<?php

class unittest_bioskop extends CI_Controller {
	
	public function __construct() {
		parent::__construct();
		$this->load->library('unit_test');

		$this->load->model('bioskop_mod');
		$this->load->library('session');
		$this->load->helper('url');
		$this->load->helper(array('form', 'url'));
	}

	public function validate($nama_bioskop,$no_telp,$alamat){
		$err = 0;
		$errVal ="";

		//Check nama bioskop
		if (empty($nama_bioskop) == true) {
            $err = $err+1;
            $errVal .= "Nama Bioskop, ";
        }

        //Check noTelp
        if (empty($no_telp)==true or preg_match('/^[0-9]{12}+$/', $no_telp)==false) {
			$err = $err+1;
			$errVal .="Nomor Telpon, ";
		}

		//Check alamat
		if (empty($alamat)==true) {
            $err = $err+1;
            $errVal .= "Alamat, ";
        }
        $error = array();
        $error[0]=$err;
        $error[1]=$errVal;
        return $error;	
	}

	public function tambah($a,$b,$c,$gambar){
		$nama_bioskop = trim($a);
		$no_telp = trim($b);
		$alamat = trim($c);

		$error = $this->validate($nama_bioskop,$no_telp,$alamat);
       	if ($error[0]==0) {
       		$id_Bioskop = "randomly generated";

			$cekada = $this->bioskop_mod->is_ada($nama_bioskop);

			if ($cekada==true) {

				if ($gambar==true) {

					$bioskop = array(
						'id_bioskop' => $id_Bioskop,
						'nama_bioskop' => $nama_bioskop,
						'no_telp' => $no_telp,
						'alamat' => $alamat,
					);
					return $hasil= array($bioskop, "gambar upload = true") ;
				} else {
					return "gambar upload = false";
				}
			} else {
				return "Nama Bioskop sudah terdaftar";
			}	
       	} else {
       		return $error[0]." Errors found. Data submit error: ".$error[1];
       	}	
	}

	public function edit($a,$b,$c,$d,$gambar){
		if ($this->bioskop_mod->is_adaId($a)==false) {
			$id_Bioskop = $a;
			$nama_bioskop = trim($b);
			$no_telp = trim($c);
			$alamat = trim($d);

			$error = $this->validate($nama_bioskop,$no_telp,$alamat);
			if ($error[0]==0) {
				$cekada = $this->bioskop_mod->is_ada($nama_bioskop);
				$before = $this->bioskop_mod->get($id_Bioskop);
				if ($cekada==true or $before[nama_bioskop]==$nama_bioskop) {
					$bioskop = array(
						'nama_bioskop' => $nama_bioskop,
						'no_telp' => $no_telp,
						'alamat' => $alamat,
					);

					$hasiltest='';
					if ($gambar==true) {
						$hasiltest .='gambar update';
					}

					return $hasil= array($bioskop, $hasiltest) ;
			    } else {
			    	return "Nama Bioskop sudah terdaftar";
			    }
			} else {
				return $error[0]." Errors found. Data submit error: ".$error[1];
			}
		} else {
			return "Nothing happen";
		}	
	}

	public function hapus($a,$term){
		if ($this->bioskop_mod->is_adaId($a)==false) {
			$id_Bioskop = $a;
			if ($term=="yes") {
				return "Bioskop berhasil dihapus";
			} else {
				return "Bioskop gagal dihapus";
			}
		} else {
			return "Nothing happen";
		}
	}

	public function report(){

		$validate = $this->validate("initest","082148147155","alamat");
		$hasil = array(0, "");
		$this->unit->run($validate, $hasil, "validate() bioskop testing");

		$tambah = $this->tambah("nama baru","082148147153","alamat",true);
		$hasil2 = array(array('id_bioskop' => "randomly generated", 'nama_bioskop' => "nama baru", 'no_telp' => "082148147153", 'alamat' => "alamat"), "gambar upload = true") ;
		$this->unit->run($tambah, $hasil2, "tambah() bioskop testing");

		$edit = $this->edit("BSKP-5dcbafa23a394","nama baru","082148147153","alamat",true);
		$hasil3 = array(array('nama_bioskop' => "nama baru", 'no_telp' => "082148147153", 'alamat' => "alamat"), 'gambar update');
		$this->unit->run($edit, $hasil3, "edit() bioskop testing");

		$hapus = $this->hapus("BSKP-5dcbafa23a394","yes");
		$this->unit->run($hapus, "Bioskop berhasil dihapus", "hapus() bioskop testing");

		echo $this->unit->report();
	}
}