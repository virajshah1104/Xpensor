<?php

require_once 'update_personal_info.php';
require_once 'update_user_info.php';
$db = new update_personal_info();
$db1 = new update_user_info();

// json response array
$response = array("error" => FALSE);

if(isset($_POST['uid']) && (isset($_POST['name'])) && (isset($_POST['amount'])) && (isset($_POST['description'])) && (isset($_POST['with_whom'])) && (isset($_POST['status_cd'])) && (isset($_POST['status_sn']))){
	
	$uid = (int)$_POST['uid'];
	$tname = $_POST['name'];
	$tamount = $_POST['amount'];
	$tdes = $_POST['description'];
	$twith = $_POST['with_whom'];
	$s_cd = $_POST['status_cd'];
	$s_sn = $_POST['status_sn'];
	
	
	if($db1->CheckExistingUser1($uid)){
		$personal = $db->StorePersonalInfo($uid, $tname, $tamount, $tdes, $twith, $s_cd, $s_sn);
		if($personal){
			$response["error"] = FALSE;
			$response["personal"]["id"] = $personal["id"];
			$response["personal"]["created_by"] = $personal["created_by"];
			$response["personal"]["transaction_name"] = $personal["transaction_name"];
			$response["personal"]["amount"] = $personal["amount"];
			$response["personal"]["description"] = $personal["description"];
			$response["personal"]["with"] = $personal["with"];
			$response["personal"]["status_1"] = $personal["status1"];
			$response["personal"]["status_2"] = $personal["status2"];
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
    $response["error_msg"] = "Required parameters (user id , amount , description , with , status1 , status 2) is missing!";
    echo json_encode($response);
}
?>