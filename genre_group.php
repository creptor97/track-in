<?php
require_once 'functions_out_put.php';
require_once 'functions.php';
include ('html/header.html');
if(!$_GET[p]){
    $_GET[p] = 1;
}
$page = $_GET['p'];
$groups = get_group_by_genre($_GET[genre_id],$page);
group_list_by_genre($groups);
include ('html/footer.html');