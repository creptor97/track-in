<?php
header('Content-Type: text/html; charset=utf-8');
require_once '../../functions.php';

if($_POST[group_name] and $_POST[date_of_create] and $_POST[genre_id] and $_POST[description] and $_POST[logo_url]){
    $grop_name = $_POST[group_name];
    $date_of_create = $_POST[date_of_create];
    $genre_id = $_POST[genre_id];
    $description = $_POST[description];
    $logo = $_POST[logo_url];
    add_group($grop_name, $date_of_create, $description, $genre_id,  $logo);
}
else{
    echo "Данні не поступили";
}




