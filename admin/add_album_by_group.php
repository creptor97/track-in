<?php
header('Content-Type: text/html; charset=utf-8');

?>

<form action="app/adding_album.php" method="post">
    <label for="album_name">Назва льбому</label><br>
    <input type="text" name="album_name" id="album_name" required><br>

    <label for="album_date_of_create">Дата створення альбому</label><br>
    <input type="date" name="album_date_of_create" id="album_date_of_create"required><br>

    <label for="album_description">Коротка історія</label><br>
    <textarea name="album_description" id="album_description" rows="7" cols="35" placeholder="Коротка історія"></textarea><br>

    <label for="album_logo">Дата створення альбому</label><br>
    <input type="url" name="album_logo" id="album_logo"required><br>

    <input type=hidden name="group_id" id="group_id"  value="<? echo "$_GET[group_id]"; ?>" >

    <input type="submit" value="Відправити">
</form>
