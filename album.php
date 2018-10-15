<?php
require_once 'functions.php';
require_once 'functions_out_put.php';
include 'html/header.html';

$songs = get_songs_by_album($_GET[album_id]);



 echo "<img src='{$songs[0][album_logo]}' src='logo'>";
foreach ($songs as $song){
    echo "<div>";
    echo "$song[song_name]<br>";
    if($song[url] != ""){
    echo "
        <iframe width=\"560\" height=\"315\" src=\"$song[url]\" frameborder=\"0\" allowfullscreen></iframe>
        ";
    }

    echo "</div>";
}







echo "<pre>";
print_r($songs);
echo "</pre>";


include 'html/footer.html';