﻿<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>E-Learning</title>

<link href="<?php echo URL; ?>media/css/bootstrap.css" rel="stylesheet">
<link href="<?php echo URL; ?>media/css/style.css" rel="stylesheet">
<link href="<?php echo URL; ?>media/css/jquery-ui.css" rel="stylesheet">

<script type="text/javascript" src="<?php echo URL; ?>media/js/jquery.js"></script>
<script type="text/javascript" src="<?php echo URL; ?>media/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<?php echo URL; ?>media/js/jquery.ui.datepicker-ro.js"></script>

<link href="<?php echo URL; ?>media/css/bootstrap-wysihtml5.css" rel="stylesheet">
<script type="text/javascript" src="<?php echo URL; ?>media/js/wysihtml5-0.3.0.js"></script>
<script type="text/javascript" src="<?php echo URL; ?>media/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<?php echo URL; ?>media/js/bootstrap-wysihtml5.js"></script>

<?php if( are_rol('administrator') ) { ?>
<?php } ?>

</head>
<body>

<div class="navbar navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container">
			<button type="button" class="btn btn-navbar">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="brand" href="<?php echo URL.'index.php' ?>">E-Learning</a>
			<div class="nav-collapse collapse">
				<p class="navbar-text pull-right">
				<?php if( isset($_SESSION['logat']) && $_SESSION['logat'] == true ) { ?>
				<?php echo $_SESSION['utilizator'], ' (', $_SESSION['rol'], ')'; ?>
				<a href="<?php echo URL . 'index.php?url=login/iesire'; ?>"><i class="icon-off icon-black"></i> Iesire</a>
				<?php } else { ?>
				<a href="#" class="navbar-link">Vizitator</a>
				<?php } ?>
				</p>
				<ul class="nav">
					<li class="active"><a href="<?php echo URL.'index.php' ?>">Acasa</a></li>
					<?php /* if( !este_logat() ) { ?>
					<li><a href="<?php echo URL.'index.php?url=login'; ?>">Cursuri</a></li>
					<?php } else { ?>
					<li><a href="<?php echo URL.'index.php?url=cursuri/cursurile_mele'; ?>">Cursuri</a></li>
					<?php } */ ?>
					<li><a href="<?php echo URL.'index.php?url=noutati'; ?>">Noutati</a></li>
				</ul>
			</div><!--/.nav-collapse -->
		</div>
	</div>
</div>

<div class="container">

	<div class="row">
		<div class="span3">
		
			<?php if( !este_logat() ) { ?>
			<div class="well">
				<form class="form-signin" method="post" action="<?php echo URL.'index.php?url=login/index' ?>">
				<h4>Intră în cont</h4>
				<input type="text" class="input-block-level" name="utilizator" placeholder="Adresa email">
				<input type="password" class="input-block-level" name="parola" placeholder="Parolă">
				<button class="btn btn-primary" type="submit" name="login">Intră</button>
				</form>
			</div>
			<?php } ?>
		
			<?php
			if( este_logat() ) {
			$nr_mesaje_necitite = nr_mesaje_necitite($_SESSION['id_utilizator']);
			?>
			<div class="well sidebar-nav">
				<ul class="nav nav-list">
					<!--<li class="nav-header">Sidebar</li>-->
					<li><a href="<?php echo URL.'index.php?url=utilizator/contul_meu' ?>"><i class="icon icon-user"></i> Profilul meu</a></li>
					<li><a href="<?php echo URL.'index.php?url=cursuri/cursurile_mele' ?>"><i class="icon icon-folder-open"></i> Cursurile mele</a></li>
					<li><a href="<?php echo URL.'index.php?url=cursuri/calendar' ?>"><i class="icon icon-calendar"></i> Calendar</a></li>
					<li><a href="<?php echo URL.'index.php?url=mesaje' ?>"><i class="icon icon-comment"></i> Mesaje &nbsp; <?php echo $nr_mesaje_necitite > 0 ? '<span class="badge badge-important">'.$nr_mesaje_necitite.'</span>' : ''; ?></a></li>
					<?php if( are_rol('administrator') ) { ?>
					<li><a href="<?php echo URL.'index.php?url=noutati/adauga' ?>"><i class="icon icon-star"></i> Adauga noutati</a></li>
					<li><a href="<?php echo URL.'index.php?url=cursuri/categorii' ?>"><i class="icon icon-folder-open"></i> Adauga categorie</a></li>
					<li class="nav-header">Setari avansate</li>
					<li><a href="<?php echo URL.'index.php?url=utilizator/lista_utilizatori' ?>"><i class="icon icon-user"></i> Utilizatori</a></li>
					<li><a href="<?php echo URL.'index.php?url=utilizator/permisiuni_utilizatori' ?>"><i class="icon icon-lock"></i> Permisiuni</a></li>
					<!--<li><a href="<?php echo URL.'index.php?url=setari' ?>"><i class="icon icon-wrench"></i> Setari generale</a></li>-->
					<?php } ?>
				</ul>
			</div>
			<?php } ?>
			
			<div class="well sidebar-nav">
				<ul class="nav nav-list">
					<li class="nav-header">Cursuri</li>
					<?php
					$cursuri_recente = cursuri_adaugate_recent();
					foreach($cursuri_recente as $curs) {
						echo '<li><a href="'.URL.'index.php?url=cursuri/curs/'.$curs['id_curs'].'">'.$curs['titlu'].'</a></li>';
					}
					?>
					<li class="divider"></li>
					<?php if( este_logat() ) { ?>
					<li><a href="<?php echo URL.'index.php?url=cursuri/cursurile_mele' ?>"><i class="icon icon-list"></i> Toate cursurile</a></li>
					<?php } else { ?>
					<li><a href="<?php echo URL.'index.php?url=login' ?>"><i class="icon icon-list"></i> Toate cursurile</a></li>
					<?php } ?>
				</ul>
			</div>
		</div><!--/span-->
		
		<div class="span9">