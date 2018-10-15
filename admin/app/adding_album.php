<?php
require_once '../../functions.php';
if($_POST[album_name] and $_POST[album_date_of_create] and $_POST[album_description] and $_POST[album_logo] and $_POST[group_id]){
    $album_name = $_POST[album_name];
    $album_date_of_create = $_POST[album_date_of_create];
    $album_description = $_POST[album_description];
    $album_logo = $_POST[album_logo];
    $group_id = $_POST[group_id];


    add_album($album_name, $album_date_of_create, $album_description, $album_logo, $group_id);


    header("Location:http://track-in.com/admin");
}
else{
    echo "Данні не поступили";
}
