<?php
require_once '../../functions.php';
header('Content-Type: text/html; charset=utf-8');
/*
echo "<pre>";
print_r($_POST);
echo "</pre>";

$member_name = $_POST[member_name];
$member_birthday = $_POST[member_birthday];
$member_history = $_POST[member_history];
$scepe_position = $_POST[scepe_position];
$member_photo_ur = $_POST[member_photo_ur];
$group_id = $_POST[group_id];

add_member($member_name, $member_birthday, $member_history, $scepe_position, $member_photo_ur, $group_id);

echo $result;
 $member_name, $member_birthday, $member_history, $member_scene_position_id, $member_photo_url, $group_id */



if($_POST[member_name]  and $_POST[scepe_position] and $_POST[group_id]){
    require_once '../../functions.php';
    $member_name = $_POST[member_name];
    $member_birthday = $_POST[member_birthday];
    $member_history = $_POST[member_history];
    $scepe_position = $_POST[scepe_position];
    $member_photo_url = $_POST[member_photo_url];
    $group_id = $_POST[group_id];
    add_member($member_name, $member_birthday, $member_history, $scepe_position, $member_photo_url, $group_id);
    header("Location:http://track-in.com/admin");
}
else{
    echo "Данні не поступили";
}

