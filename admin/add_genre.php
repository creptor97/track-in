<?php
header('Content-Type: text/html; charset=utf-8');
?>

<form action="app/adding_genre.php" method="get">
    <label for="name_of_genre">Введіть назву жанру</label>
    <input type="text" name="name_of_genre" id="name_of_genre"><br>
    <input type="submit" value="Додати">
</form>
