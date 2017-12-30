<?php

require_once 'update_user_info.php';
$db = new update_user_info();

// json response array
$response = array("error" => FALSE);

if (isset($_POST['name']) && isset($_POST['email']) && isset($_POST['phone']) && isset($_POST['password']) && isset($_POST['retypepass'])) {

    // receiving the post params
    $name = $_POST['name'];
    $email = $_POST['email'];
	$phone = $_POST['phone'];
    $password = $_POST['password'];
    $retypepass = $_POST['retypepass'];
    

    // check if user is already existed with the same email
    if ($db->CheckExistingUser($email)) {
        // user already existed
        $response["error"] = TRUE;
        $response["error_msg"] = "User already existed with " . $email;
        echo json_encode($response);
    }else{
		if($password == $retypepass){
        // create a new user
        $user = $db->StoreUserInfo($name, $email, $phone, $password, $retypepass);
        if ($user) {
            // user stored successfully
            $response["error"] = FALSE;
            $response["user"]["name"] = $user["name"];
            $response["user"]["email"] = $user["email"];
            $response["user"]["phone"] = $user["phone"];
            echo json_encode($response);
        } else {
            // user failed to store
            $response["error"] = TRUE;
            $response["error_msg"] = "Unknown error occurred in registration!";
            echo json_encode($response);
        }
		}
		else{
			$response["error"] = TRUE;
            $response["error_msg"] = "Password and Retype Password dont match.";
            echo json_encode($response);
		}
}
} else {
    $response["error"] = TRUE;
    $response["error_msg"] = "Required parameters (name, email, password, retypepass, phone number) is missing!";
    echo json_encode($response);
}
?>