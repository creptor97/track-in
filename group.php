<?php
require_once 'functions.php';
require_once 'functions_out_put.php';
include 'html/header.html';

$group_id = $_GET[group_id];
$group = get_group_by_id($group_id);
$members = get_group_members($group_id);
$albums =  get_group_albums($group_id);

group_info($group[0]);
member_list($members);
album_block($albums);
include 'html/footer.html';