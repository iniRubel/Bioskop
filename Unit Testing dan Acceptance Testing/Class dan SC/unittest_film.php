<?php

class unittest_film extends CI_Controller {
	
	public function __construct() {
		parent::__construct();
		$this->load->library('unit_test');
		
		$this->load->model('makmin_mod');
		$this->load->model('film_mod');
		$this->load->library('session');
		$this->load->helper('url');
		$this->load->helper(array('form', 'url'));
	}

	public function validate($judul,$durasi,$sinopsis,$gendre,$sutradara,$rating,$link_trailer,$rilisRange){
		$err = 0;
		$errVal ="";

		//Check judul
		if (empty($judul) == true) {
            $err = $err+1;
            $errVal .= "Judul, ";
        }

        //Check durasi
		if (empty($durasi) == true) {
            $err = $err+1;
            $errVal .= "Durasi, ";
        }

        //Check sinopsis
		if (empty($sinopsis) == true) {
            $err = $err+1;
            $errVal .= "Sinopsis, ";
        }

        //Check gendre
		if (empty($gendre) == true) {
            $err = $err+1;
            $errVal .= "Gendre, ";
        }

        //Check sutradara
		if (empty($sutradara) == true) {
            $err = $err+1;
            $errVal .= "Sutradara, ";
        }

        //Check rating
		if (empty($rating) == true or ($rating == "rating_su" or $rating == "rating_13" or $rating == "rating_17" or $rating == "rating_21")==false) {
            $err = $err+1;
            $errVal .= "Rating, ";
        }

        //Check link_trailer
		if (empty($link_trailer) == true) {
            $err = $err+1;
            $errVal .= "Link trailer, ";
        }

        //Check rilisRange
		if (empty($rilisRange) == true or preg_match("/^[0-9]{4}+-[0-9]{1,2}+-[0-9]{1,2}+ - +[0-9]{4}+-[0-9]{1,2}+-[0-9]{1,2}$/", $rilisRange)==false) {
            $err = $err+1;
            $errVal .= "Rilis, ";
        }
        
        $error = array();
        $error[0]=$err;
        $error[1]=$errVal;
        return $error;	
	}

	public function tambah($a,$b,$c,$d,$e,$f,$g,$h,$poster,$gambar1,$gambar2,$gambar3){
		
		$judul =  trim($a);
		$durasi =  trim($b);
		$sinopsis = trim($c);
		$gendre = trim($d);
		$sutradara = trim($e);
		$rating = trim($f);
		$link_trailer = trim($g);
		$rilisRange = trim($h);
		
		$error = $this->validate($judul,$durasi,$sinopsis,$gendre,$sutradara,$rating,$link_trailer,$rilisRange);

		if ($error[0]==0) {
			$id_film = "randomly generated";
			
			$fileErr = 0;
			$fileErrVal = "";
			if ($poster==false) { 
				$fileErr = $fileErr+1;
				$fileErrVal .= "'poster', ";
			}
			if ($gambar1==false) {
				$fileErr = $fileErr+1;
				$fileErrVal .= "'gambarFilm1', ";
			}
			if ($gambar2==false) {
				$fileErr = $fileErr+1;
				$fileErrVal .= "'gambarFilm2', ";
			}
			if ($gambar3==false) {
				$fileErr = $fileErr+1;
				$fileErrVal .= "'gambarFilm3', ";
			}
			
			
			if ($fileErr==0) {
		        $dateSplit = explode(" - ",$rilisRange);
		        $film = array(
					'id_film' => $id_film,
					'judul' => $judul,
					'durasi' => $durasi,
					'sinopsis' => $sinopsis,
					'gendre' => $gendre,
					'sutradara' => $sutradara,
					'rating' => $rating,
					'link_trailer' => $link_trailer,
					'rilis_start'=> $dateSplit[0],
					'rilis_end'=> $dateSplit[1],
				);

				return $hasil= array($film, "poster,gambar1,gambar2,gambar3 upload = true") ;
			} else {
				return $fileErr." Errors found. Data submit error: noFile for ".$fileErrVal;
			}
		} else {
			return $error[0]." Errors found. Data submit error: ".$error[1];
		}
	}

	public function edit($a,$b,$c,$d,$e,$f,$g,$h,$i,$poster,$gambar1,$gambar2,$gambar3){
		if ($this->film_mod->is_adaId($a)==false) {
			$id_film =trim($a);
			$judul =  trim($b);
			$durasi =  trim($c);
			$sinopsis = trim($d);
			$gendre = trim($e);
			$sutradara = trim($f);
			$rating = trim($g);
			$link_trailer = trim($h);
			$rilisRange = trim($i);

			$file="";
			if ($poster==true) {
				$file .="poster,";
			}

			if ($gambar1==true) {
				$file .="gambar1,";
			}

			if ($gambar2==true) {
				$file .="gambar2,";;
			}

			if ($gambar3==true) {
				$file .="gambar3,";
			}

	        $error = $this->validate($judul,$durasi,$sinopsis,$gendre,$sutradara,$rating,$link_trailer,$rilisRange);
	        if ($error[0]==0) {
		        $dateSplit = explode(" - ",$rilisRange);
		        $film = array(
					'id_film' => $id_film,
					'judul' => $judul,
					'durasi' => $durasi,
					'sinopsis' => $sinopsis,
					'gendre' => $gendre,
					'sutradara' => $sutradara,
					'rating' => $rating,
					'link_trailer' => $link_trailer,
					'rilis_start'=> $dateSplit[0],
					'rilis_end'=> $dateSplit[1],
				);

				return $hasil= array($film, $file." Update");
	        } else {
	        	return $error[0]." Errors found. Data submit error: ".$error[1];
	        }
	    } else {
			redirect('admin/admin_Film/');
		}
	}

	public function hapus($a,$term){
		if ($this->film_mod->is_adaId($a)==false) {
			$id_film = $a;
			if ($term=="yes") {
				return "Film berhasil dihapus";
			} else {
				return "Film gagal dihapus";
			}
		} else {
			return "Nothing happen";
		}
	}

	public function report(){
		$validate = $this->validate("iniJudul","durasi","sinopsis","inigendre","nama","rating_su","https://www.youtube.com/","2019-11-30 - 2019-12-05");
		$hasil = array(0, "");
		$this->unit->run($validate, $hasil, "validate() Film testing");

		$tambah = $this->tambah("iniJudul","durasi","sinopsis","inigendre","nama","rating_su","https://www.youtube.com/","2019-11-30 - 2019-12-05", true,true,true,true);
		$hasil2 = array(array('id_film' => "randomly generated", 'judul' => "iniJudul", 'durasi' => "durasi",'sinopsis' => "sinopsis",'gendre' => "inigendre",'sutradara' => "nama",'rating'=> "rating_su",'link_trailer' => "https://www.youtube.com/",'rilis_start'=> '2019-11-30', 'rilis_end'=> '2019-12-05'), "poster,gambar1,gambar2,gambar3 upload = true");
		$this->unit->run($tambah, $hasil2, "tambah() Film testing");

		$edit = $this->edit("FLM-5dccfe056c909","iniJudul","durasi","sinopsis","inigendre","nama","rating_su","https://www.youtube.com/","2019-11-30 - 2019-12-05", false,false,false,true);
		$hasil3 = array(array('id_film' => "FLM-5dccfe056c909", 'judul' => "iniJudul", 'durasi' => "durasi",'sinopsis' => "sinopsis",'gendre' => "inigendre",'sutradara' => "nama",'rating'=> "rating_su",'link_trailer' => "https://www.youtube.com/",'rilis_start'=> '2019-11-30', 'rilis_end'=> '2019-12-05'), "gambar3, Update");
		$this->unit->run($edit, $hasil3, "edit() testing");

		$hapus = $this->hapus("FLM-5dccfe056c909","yes");
		$this->unit->run($hapus, "Film berhasil dihapus", "hapus() Film testing");

		echo $this->unit->report();
	}
}