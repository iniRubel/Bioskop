<?php

class unittest_makmin extends CI_Controller {
	
	public function __construct() {
		parent::__construct();
		$this->load->library('unit_test');
		
		$this->load->model('makmin_mod');
		$this->load->library('session');
		$this->load->helper('url');
		$this->load->helper(array('form', 'url'));
	}

	public function validate($nama_makmin,$keterangan,$harga){
		$err = 0;
		$errVal ="";

		//Check nama makmin
		if (empty($nama_makmin) == true) {
            $err = $err+1;
            $errVal .= "Nama Makmin, ";
        }

        //Check keterangan
		if (empty($keterangan) == true) {
            $err = $err+1;
            $errVal .= "Keterangan, ";
        }

		//Check harga
		if (empty($harga)==true or is_numeric($harga)==false) {
            $err = $err+1;
            $errVal .= "Harga, ";
        }

        $error = array();
        $error[0]=$err;
        $error[1]=$errVal;
        return $error;	
	}

	public function tambah($a,$b,$c,$gambar){
		$nama_makmin = trim($a);
		$keterangan = trim($b);
		$harga = trim($c);

		$error = $this->validate($nama_makmin,$keterangan,$harga);

		if ($error[0]==0) {
			$id_Makmin = "randomly generated";
			$cekada = $this->makmin_mod->is_ada($nama_makmin);
			if ($cekada==true) {

				if($gambar == true){
					$makmin = array(
						'id_makmin' => $id_Makmin,
						'nama_makmin' => $nama_makmin,
						'keterangan' => $keterangan,
						'harga' => $harga,
					);
					return $hasil= array($makmin, 'gambar upload = true') ;
				}else{
		        	return "gambar upload = false";
		        }
			} else {
				return "Nama Makmin sudah terdaftar";
			}	
		} else {
			return $error[0]." Errors found. Data submit error: ".$error[1];
		}	
	}

	public function edit($a,$b,$c,$d,$gambar){
		if ($this->makmin_mod->is_adaId($a)==false) {
			$id_Makmin = $a;
			$nama_makmin = trim($b);
			$keterangan = trim($c);
			$harga = trim($d);

			$error = $this->validate($nama_makmin,$keterangan,$harga);
			if ($error[0]==0) {
				$cekada = $this->makmin_mod->is_ada($nama_makmin);
				$before = $this->makmin_mod->get($id_Makmin);
				if ($cekada==true or $before[nama_makmin]==$nama_makmin) {
					$makmin = array(
						'id_makmin' => $id_Makmin,
						'nama_makmin' => $nama_makmin,
						'keterangan' => $keterangan,
						'harga' => $harga,
					);

					$hasiltest='';
					if ($gambar==true) {
						$hasiltest .='gambar update';
					}

					return $hasil= array($makmin, $hasiltest) ;

			    } else {
			    	return "Nama Makmin sudah terdaftar";
			    }
			} else {
				return $error[0]." Errors found. Data submit error: ".$error[1];
			}
		} else {
			return "Nothing happen";
		}	
	}

	public function hapus($a,$term){
		if ($this->makmin_mod->is_adaId($a)==false) {
			$id_Makmin = $a;
			if ($term=="yes") {
				return "Makmin berhasil dihapus";
			} else {
				return "Makmin gagal dihapus";
			}
		} else {
			return "Nothing happen";
		}
	}

	public function report(){

		$validate = $this->validate("namaMakmin","iniKeterangan","14000");
		$hasil = array(0, "");
		$this->unit->run($validate, $hasil, "validate() Makmin testing");

		$tambah = $this->tambah("nama baru","iniKeterangan","14000",true);
		$hasil2 = array(array('id_makmin' => "randomly generated", 'nama_makmin' => "nama baru", 'keterangan' => "iniKeterangan", 'harga' => "14000"), "gambar upload = true");
		$this->unit->run($tambah, $hasil2, "tambah() Makmin testing");

		$edit = $this->edit("MKN-5dd7e3343dc3b","nama baru","iniKeterangan","14000",false);
		$hasil3 = array(array('id_makmin' => "MKN-5dd7e3343dc3b", 'nama_makmin' => "nama baru", 'keterangan' => "iniKeterangan", 'harga' => "14000"), '');
		$this->unit->run($edit, $hasil3, "edit() Makmin testing");

		$hapus = $this->hapus("MKN-5dd7e3343dc3b","yes");
		$this->unit->run($hapus, "Makmin berhasil dihapus", "hapus() Makmin testing");

		echo $this->unit->report();
	}
}