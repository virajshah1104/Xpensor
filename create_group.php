<?php

require_once 'update_group_info.php';
require_once 'update_user_info.php';
$db = new update_group_info();
$db1 = new update_user_info();

// json response array
$response = array("error" => FALSE);

if((isset($_POST['uid'])) && (isset($_POST['gname']))){
	
	$user_id = $_POST['uid'];
	$group_name = $_POST['gname'];
	
	if($db1->CheckExistingUser1($user_id)){
		$group = $db->StoreGroupInfo($user_id, $group_name);
		if($group){
			$response["error"] = FALSE;
			$response["group"]["id"] = $group["id"];
			$response["group"]["name"] = $group["name"];
			$response["group"]["create"] = $group["create"];
			echo json_encode($response);
		}
		else{
			$response["error"] = TRUE;
            $response["error_msg"] = "Unknown error occurred in registration!";
            echo json_encode($response);
		}
	}
} else {
    $response["error"] = TRUE;
    $response["error_msg"] = "Required parameters (user id and group name) is missing!";
    echo json_encode($response);
}
?>