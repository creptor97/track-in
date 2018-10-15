<?php
require_once 'functions.php';
require_once 'functions_out_put.php';
include 'html/header.html';
if(!$_GET[p]){
    $_GET[p] = 1;
}
$page = $_GET['p'];

$group_list = get_group_list($page);
group_list($group_list);
pagination($page,'group_list.php');
include 'html/footer.html';



