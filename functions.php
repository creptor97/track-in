    <?php
    $link = mysqli_connect('localhost','root','','track_in');
    if (!$link){
        echo "DB connection error";
    }

    function get_group_list_for_admin(){
        global $link;

        $sql  = "SELECT * from group_t LEFT JOIN group_genre on group_t.group_id = group_genre.group_id left JOIN genre on group_genre.genre_id = genre.genre_id 
               ";
        $result = mysqli_query($link, $sql);
        $groups = mysqli_fetch_all($result,MYSQLI_ASSOC);
        return $groups;
    }

    function get_group_list($page){
        global $link;
        $count_of_groups_on_page = 10;
        $page_to = $page* $count_of_groups_on_page;
        $page_from = $page_to- $count_of_groups_on_page;
        $sql  = "SELECT * from group_t LEFT JOIN group_genre on group_t.group_id = group_genre.group_id left JOIN genre on group_genre.genre_id = genre.genre_id 
                 LIMIT $page_from, $page_to";
        $result = mysqli_query($link, $sql);
        $groups = mysqli_fetch_all($result,MYSQLI_ASSOC);
        return $groups;
    }

    function get_group_by_id($group_id){
        global $link;
        $sql  = 'SELECT * from group_t 
        LEFT JOIN group_genre on group_t.group_id = group_genre.group_id 
        left JOIN genre on group_genre.genre_id = genre.genre_id
        WHERE group_t.group_id ='.$group_id;
        $result = mysqli_query($link, $sql);
        $groups = mysqli_fetch_all($result,MYSQLI_ASSOC);
        return $groups;
    }

    function get_group_members($group_id){
        global $link;
        $sql  = 'SELECT member.member_name, member.member_birthday, member.member_history, member.member_photo_url, group_t.group_name, scene_position.position 
        FROM group_t 
        LEFT JOIN group_member on group_t.group_id = group_member.group_id
        LEFT JOIN member on group_member.group_member_id = member.member_id
        LEFT JOIN scene_position on member.member_scene_position_id = scene_position.scene_position_id
        WHERE group_t.group_id ='.$group_id;
        $result = mysqli_query($link, $sql);
        $members = mysqli_fetch_all($result,MYSQLI_ASSOC);
        return $members;
    }

    function get_members_list($page){
        global $link;


        $count_of_groups_on_page = 10;
        $page_to = $page* $count_of_groups_on_page;
        $page_from = $page_to- $count_of_groups_on_page;

        $sql = "select member.member_id, member.member_name, member.member_photo_url, scene_position.position, group_t.group_name, group_t.group_id from member
        left join group_member ON member.member_id = group_member.group_member_id
        left join scene_position on member.member_scene_position_id = scene_position.scene_position_id
        left join group_t on group_member.group_id = group_t.group_id
        LIMIT $page_from, $page_to
        ";
        $result = mysqli_query($link, $sql);
        $members_list = mysqli_fetch_all($result,MYSQLI_ASSOC);
        return $members_list;

    }

    function get_group_albums($group_id){
        global $link;
        $sql  = 'SELECT * FROM group_t
        LEFT JOIN album on group_t.group_id = album.group_id 
        where group_t.group_id ='.$group_id;
        $result = mysqli_query($link, $sql);
        $albums = mysqli_fetch_all($result,MYSQLI_ASSOC);
        return $albums;
    }

    function get_genre_list(){
        global $link;

        $sql  = "SELECT * FROM `genre`";
        $result = mysqli_query($link, $sql);
        $genre_list = mysqli_fetch_all($result,MYSQLI_ASSOC);
        return $genre_list;
    }

    function get_genre_list_page($page){
        global $link;
        $count_of_groups_on_page = 10;
        $page_to = $page* $count_of_groups_on_page;
        $page_from = $page_to- $count_of_groups_on_page;

        $sql  = "SELECT * FROM `genre` LIMIT $page_from, $page_to";
        $result = mysqli_query($link, $sql);
        $genre_list = mysqli_fetch_all($result,MYSQLI_ASSOC);
        return $genre_list;
    }

    function get_scepe_position_list(){
        global $link;
        $sql  = "SELECT * FROM `scene_position`";
        $result = mysqli_query($link, $sql);
        $scepe_position_list = mysqli_fetch_all($result,MYSQLI_ASSOC);
        return $scepe_position_list;
    }

    function get_group_by_genre($genre_id,$page){
        $count_of_groups_on_page = 10;
        $page_to = $page* $count_of_groups_on_page;
        $page_from = $page_to- $count_of_groups_on_page;

        global $link;
        $sql = "SELECT * FROM group_t 
        left join group_genre on group_t.group_id = group_genre.group_id where genre_id = $genre_id
        LIMIT $page_from, $page_to";
        $result = mysqli_query($link, $sql);
        $groups = mysqli_fetch_all($result,MYSQLI_ASSOC);
        return $groups;
    }

    /*
                                    Функції для додавання контенту
    */
    function add_group($group_name, $date_of_create, $description, $genre_id, $logo_url){
        global $link;

        $group_name =mysqli_real_escape_string($link,$group_name);
        $date_of_create =mysqli_real_escape_string($link,$date_of_create);
        $description =mysqli_real_escape_string($link,$description);
        $genre_id =mysqli_real_escape_string($link,$genre_id);
        $logo_url =mysqli_real_escape_string($link,$logo_url);

        $sql  = "INSERT INTO group_t (`group_name`,`group_genre_id`,`group_logo`,`group_date_of_create`, `group_description`) 
        VALUES ('$group_name', '$genre_id', '$logo_url', '$date_of_create', '$description')";
        mysqli_query($link, $sql);
        $last_id = mysqli_insert_id($link);
        $sql  = "INSERT INTO `group_genre` (`group_id`, `genre_id`) 
        VALUES ('$last_id', '$genre_id')";
        mysqli_query($link, $sql);
    }

    function add_genre($genre_name){
        global $link;
        $genre_name =mysqli_real_escape_string($link,$genre_name);
        $sql  = "INSERT INTO `genre` (`genre_name`) VALUES ('$genre_name')";
        $result = mysqli_query($link, $sql);
        return $result;
    }

    function add_member($member_name, $member_birthday, $member_history, $member_scene_position_id, $member_photo_url, $group_id){
        global $link;
        $member_name =mysqli_real_escape_string($link,$member_name);
        $member_birthday =mysqli_real_escape_string($link,$member_birthday);
        $member_history =mysqli_real_escape_string($link,$member_history);
        $member_scene_position_id =mysqli_real_escape_string($link,$member_scene_position_id);
        $member_photo_url =mysqli_real_escape_string($link,$member_photo_url);
        $sql  = "INSERT INTO `member` (`member_name`, `member_birthday`, `member_history`, `member_scene_position_id`, `member_photo_url`) 
        VALUES ('$member_name', '$member_birthday', '$member_history', '$member_scene_position_id', '$member_photo_url')";
        $result = mysqli_query($link, $sql);
        $last_id = mysqli_insert_id($link);
        $sql_2  = "INSERT INTO `group_member` (`group_id`, `group_member_id`) 
        VALUES ('$group_id', '$last_id')";
        mysqli_query($link, $sql_2);
    }

    function add_album($album_name, $album_date_of_create, $album_description, $album_logo, $group_id){
        global $link;

        $album_name =mysqli_real_escape_string($link,$album_name);
        $album_date_of_create =mysqli_real_escape_string($link,$album_date_of_create);
        $album_description =mysqli_real_escape_string($link,$album_description);
        $album_logo =mysqli_real_escape_string($link,$album_logo);
        $group_id =mysqli_real_escape_string($link,$group_id);

        $sql  = "INSERT INTO `album` (`album_id`, `album_name`, `album_date_of_create`, `album_description`, `album_logo`, `group_id`) 
        VALUES (NULL, '$album_name', '$album_date_of_create', '$album_description', '$album_logo', '$group_id')";

        $result = mysqli_query($link, $sql);
        return $result;
    }

    function get_songs_by_album($album_id){
        global $link;

        $sql = "SELECT song.song_id, song.album_id, song.song_name, song.url, album.album_logo FROM `album`
        left join song on album.album_id = song.album_id
        where album.album_id = $album_id";

        $result = mysqli_query($link, $sql);
        $groups = mysqli_fetch_all($result,MYSQLI_ASSOC);
        return $groups;
    }

    function get_album_by_id($album_id){
        global $link;

        $sql = "SELECT * FROM `album`
        where album_id = $album_id";

        $result = mysqli_query($link, $sql);
        $album = mysqli_fetch_all($result,MYSQLI_ASSOC);
        return $album;

    }

