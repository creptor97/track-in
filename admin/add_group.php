<?php
header('Content-Type: text/html; charset=utf-8');
require_once '../functions.php';
$genre_list = get_genre_list();
?>

<form action="app/adding_group.php" method="post">
    <label for="group_name">Назва гурту</label>
    <input type="text" name="group_name" id="group_name" placeholder="Введіть назву"><br>
    <label for="date_of_create">Дата створення</label>
    <input type="date" name="date_of_create" id="date_of_create"><br>
    <label for="genre_id">Дата створення</label>
    <select name="genre_id" id="genre_id">
        <?foreach ($genre_list as $genre){
            ?>
            <option value="<?echo $genre[genre_id]?>"><?echo $genre[genre_name]?></option>
            <?
        } ?>
    </select><br>
    <textarea name="description" id="description" rows="7" cols="35" placeholder="Опис гурту"></textarea><br>
    <label for="logo_url">Посилання на зображення</label>
    <input type="url" id="logo_url" name="logo_url"><br>
    <input type="submit">
</form>
