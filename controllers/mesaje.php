<?php

class Mesaje extends Controller {

	public function __construct() {
		parent::__construct();
		$this->incarcaModel('mesaj');
	}
	
	public function index() {
		$data = array();
		if( isset($_SESSION['mesaj']) ) {
			$data['mesaj'] = $_SESSION['mesaj'];
			unset($_SESSION['mesaj']);
		}
		$data['mesaje'] = $this->mesaj->lista_mesaje((int) $_SESSION['id_utilizator']);
		$data['mesaje_trimise'] = $this->mesaj->lista_mesaje_trimise((int) $_SESSION['id_utilizator']);
		$this->view->render('mesaje', $data, false);
	}
	
	public function citeste($id_mesaj) {
		$data = array();
		$data['detalii_mesaj'] = $this->mesaj->detalii_mesaj($id_mesaj);
		if( $data['detalii_mesaj']['status'] == 0 ) {
			$this->mesaj->marcheaza_citit($id_mesaj);
		}
		$this->view->render('citeste_mesaj', $data, false);
	}
	
	public function sterge($id_mesaj) {
		if( $this->mesaj->sterge_mesaj($id_mesaj) ) {
			$_SESSION['mesaj'] = '<div class="alert alert-success">Mesajul a fost sters!</div>';
		} else {
			$_SESSION['mesaj'] = '<div class="alert alert-error">A intervenit o eroare in momentul stergerii mesajului!</div>';
		}
		redirect('index.php?url=mesaje');
	}
	
	public function trimite_mesaj() {
		$data = array();
		if( isset($_POST['trimite']) ) {
			$validare_formular = new Validare_Formular;
			$validare_formular->set_rules('id_destinatar', 'UTILIZATOR', 'trim|obligatoriu');
			$validare_formular->set_rules('subiect', 'SUBIECT', 'trim|obligatoriu');
            $validare_formular->set_rules('mesaj', 'MESAJ', 'trim|obligatoriu');
            if( $validare_formular->run() == FALSE ) {
                // eroare
                $data['mesaj'] = $validare_formular->error_string('<div class="alert alert-error">', '</div>');
            } else {
                // salveaza datele
                $inserare = array(
                    'id_utilizator' => (int) $_SESSION['id_utilizator'],
                    'id_destinatar' => (int) $_POST['id_destinatar'],
                    'subiect' => $_POST['subiect'],
                    'mesaj' => $_POST['mesaj'],
                );
                // datele au fost introduse
                if( $this->mesaj->adauga_mesaj($inserare) ) {
                    unset($_POST);
                    $data['mesaj'] = '<div class="alert alert-success">Mesajul a fost salvat! &nbsp;&nbsp;&nbsp; <a class="btn" href="'.URL.'index.php?url=mesaje">Vezi toate mesajele</a></div>';
                } else {
                    $data['mesaj'] = '<div class="alert alert-error">A intervenit o eroare in momentul salvarii meajului! <br />'.mysql_error().'</div>';
                }
            }
		}
		$this->view->render('trimite_mesaj', $data, false);
	}
	
	public function cauta_destinatar($destinatar) {
		$potriviri = $this->mesaj->cauta_destinatar($destinatar);
		echo json_encode($potriviri);
		exit();
	}

} 