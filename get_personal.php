<?php
require_once 'update_personal_info.php';
$db = new update_personal_info();

// json response array
$response = array("error" => FALSE);

if (isset($_POST['uid'])) {

    // receiving the post params
    $uid = (int)$_POST['uid'];

    // get the user by email and password
    $user = array();
	$user=$db->GetInfo($uid);
	$l = count($user);

    if ($user != false) {
        // use is found
        $response["error"] = FALSE;
		$response["length"] = $l;
		for($i=0;$i<$l;$i++){
        $response["user"][$i] = $user[$i];
		}
        echo json_encode($response);
    } else {
        // user is not found with the credentials
        $response["error"] = TRUE;
        $response["error_msg"] = "Login credentials are wrong. Please try again!";
        echo json_encode($response);
    }
} else {
    // required post params is missing
    $response["error"] = TRUE;
    $response["error_msg"] = "Required parameters email or password is missing!";
    echo json_encode($response);
}
?>