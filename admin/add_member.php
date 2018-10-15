<?php
header('Content-Type: text/html; charset=utf-8');
require_once '../functions.php';

echo "Список груп<br>";
$group_list = get_group_list_for_admin();

foreach ($group_list as $group){
    ?>

    <a href="add_member_by_group.php?group_id=<? echo "$group[group_id]"?> "><? echo "$group[group_name]"?></a>
    - <? echo "$group[genre_name]"?><br>

    <?
}
