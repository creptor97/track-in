<?php
require_once 'functions.php';
require_once 'functions_out_put.php';
include 'html/header.html';
if(!$_GET[p]){
    $_GET[p] = 1;
}
$page = $_GET['p'];
$members = get_members_list($_GET[p]);
member_list_all($members);

pagination($page, 'members_list.php');

include 'html/footer.html';