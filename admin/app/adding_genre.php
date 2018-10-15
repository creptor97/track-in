<?php
header('Content-Type: text/html; charset=utf-8');

if($_GET[name_of_genre]){
    require_once '../../functions.php';
    $name_of_genre = $_GET[name_of_genre];
    add_genre($name_of_genre);
    header("Location:http://lab.com/lab10/admin/add_genre.php");
}
else{
    echo "Данні не поступили";
}

