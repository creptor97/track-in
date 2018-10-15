<?php
require_once 'functions_out_put.php';
require_once 'functions.php';
include ('html/header.html');

if(!$_GET[p]){
    $_GET[p] = 1;
}
$page = $_GET['p'];

$genre_list = get_genre_list_page($_GET[p]);
genre_list($genre_list);
pagination($page, 'genre_list.php');
include ('html/footer.html');
