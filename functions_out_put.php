<?php


function album_block($album_array){
    echo "<hr>";
    echo "<h3 class='band_albums'>Альбоми гурту</h3><br>";
    foreach ($album_array as $album){
        echo "<div class='album_list_block'>";
        echo "<img class='album_list_logo' src='$album[album_logo]' alt='logo'>";
        echo "<h4 class='album_list_name' >
<a class='album_list_name_a' href='album.php?album_id=$album[album_id]'>$album[album_name]</a>
</h4>";
        echo "</div>";
    }
}
function group_info($group)
{
    echo "
<div class='group_info'>
<h3 class='band_name'>$group[group_name] </h3><br>
<img id='group_logo'  src='$group[group_logo]'><br>
<span class='group_info_item'>Назва гурту: </span>
<span>$group[group_name]</span><br>
<span class='group_info_item'>Дата створення: </span>
<span> $group[group_date_of_create] </span><br>
<span class='group_info_item'>Опис гурту: </span>
<span>$group[group_description]</span><br>
<span class='group_info_item'>Жанр: </span>
<span>$group[genre_name]</span><br>
</div>
";
}

function member_list($members){
    echo "<hr>
    <h3 class='band_members'>Учасники гурту</h3><br>";
    foreach ($members as $member){
        echo "
        <div class='member_info_block'>
        <div class='member_info'>
            <img class='member_photo' src='$member[member_photo_url]'>
            <span class='member_info_item'>Ім'я:</span>
            <span> $member[member_name]<br></span>
            <span class='member_info_item'>Дата народження:</span>
            <span>$member[member_birthday]<br></span>
            <span class='member_info_item'> Гурт: </span>
            <span>$member[group_name]<br></span>
            <span  class='member_info_item'>Діяльність/Історія: </span>
            <span>$member[member_history]?><br></span>
            <span class='member_info_item'>Позиція: </span>
            <span>$member[position]</span>
        </div>
    </div>        
        ";
    }
}

function group_list($group_list){
    echo" <div class=\"group_list\">";
    foreach ($group_list as $group){
        echo "<a class='group_list_item' href='group.php?group_id=".$group[group_id]."'>$group[group_name] - $group[genre_name]</a>";
    }
}

function group_list_by_genre($group_list){
    echo" <div class=\"group_list\">";
    foreach ($group_list as $group){
        echo "<a class='group_list_item' href='group.php?group_id=$group[group_id]'>$group[group_name]</a>";
    }
}

function genre_list($genre_list){
    echo" <div class=\"group_list\">";
    foreach ($genre_list as $genre){
        echo "<a class='genre_list_item' href='genre_group.php?genre_id=$genre[genre_id]'> $genre[genre_name]</a>";

    }
}

function member_list_all($members){
    foreach ($members as $member){
        echo "
            <div class='members_list_item'>
            <img class='photo_small' src='$member[member_photo_url]' alt='logo'>
            <span >$member[member_name] - </span>
            <a href='group.php?group_id=$member[group_id]'>$member[group_name]</a>
            <span> - $member[position]</span>
            </div>";
    }
}

function pagination_for_group_list($page){
    $page_down = $page -1;
    $page_up = $page+1;
   echo " <div class=\"pagination\">
    <a href=\"group_list.php?p=\"$page_down\"><-Сюди</a>
    <a href=\"group_list.php?p=$page_up\">Туди-></a>
</div>
";
}

function pagination($page,$file){
    $page_down = $page -1;
    $page_up = $page+1;
    echo " <div class=\"pagination\">
    <a href=\"$file?p=$page_down\"><-Сюди</a>
    <a href=\"#\"$page_down\">$page</a>
    <a href=\"$file?p=$page_up\">Туди-></a>
</div>
";
}