<?php
header('Content-Type: text/html; charset=utf-8');
require_once '../functions.php';
$scepe_position_list = get_scepe_position_list();
?>


<form action="app/adding_member.php" method="post">
    <label for="member_name">Ім'я</label><br>
    <input type="text" name="member_name" id="member_name" required><br>

    <label for="member_birthday">Дата народження</label><br>
    <input type="date" name="member_birthday" id="member_birthday"required><br>

    <label for="member_history">Коротка історія</label><br>
    <textarea name="member_history" id="member_history" rows="7" cols="35" placeholder="Коротка історія"></textarea><br>

    <label for="scepe_position">Позиція на сцені</label><br>
    <select name="scepe_position" id="scepe_position">
    <?foreach ($scepe_position_list as $scepe_position){
        ?>
        <option value="<?echo $scepe_position[scene_position_id]?>"><?echo $scepe_position[position]?></option>
        <?
    } ?>
    </select><br>

    <label for="member_photo_url">Посилання на фотографію</label><br>
    <input type="url" name="member_photo_url" id="member_photo_url"required><br>
    <input type=hidden name="group_id" id="group_id"  value="<? echo "$_GET[group_id]"; ?>" >
    <input type="submit">
</form>
