<?php

class update_user_info {

    private $conn;

    // constructor
    function __construct() {
        require_once 'android_login_connect.php';
        // connecting to database
        $db = new android_login_connect();
        $this->conn = $db->connect();
    }

    // destructor
    function __destruct() {

    }

    /**
     * Storing new user
     * returns user details
     */
	
    public function StoreUserInfo($name, $email, $phone, $password, $retypepass) {

        $stmt = $this->conn->prepare("INSERT INTO user(name, email, phone, password, retypepass) VALUES(?, ?, ?, ?, ?)");
        $stmt->bind_param("ssiss", $name, $email, $phone, $password, $retypepass);
        $result = $stmt->execute();
        $stmt->close();

        // check for successful store
        if ($result) {
            $stmt = $this->conn->prepare("SELECT name, email, phone, password, retypepass FROM user WHERE email = ?");
            $stmt->bind_param("s", $email);
            $stmt->execute();
            $stmt-> bind_result($token2,$token3,$token4,$token5,$token6);
            while ( $stmt-> fetch() ) {
               $user["name"] = $token2;
               $user["email"] = $token3;
               $user["phone"] = $token4;
            }
            $stmt->close();
            return $user;
        } else {
          return false;
        }
    }

    /**
     * Get user by email and password
     */
    public function VerifyUserAuthentication($email, $password) {

        $stmt = $this->conn->prepare("SELECT uid, name, email, password, retypepass FROM user WHERE email = ?");

        $stmt->bind_param("s", $email);

        if ($stmt->execute()) {
            $stmt-> bind_result($token1,$token2,$token3,$token4,$token5);

            while ( $stmt-> fetch() ) {
				$user["uid"] = $token1;
               $user["name"] = $token2;
               $user["email"] = $token3;
            }

            $stmt->close();
			if($password == $token4)
				return $user;
			else
				return NULL;
            }
			else {
            return NULL;
        }
    }

    /**
     * Check user is existed or not
     */
    public function CheckExistingUser($email) {
        $stmt = $this->conn->prepare("SELECT email from user WHERE email = ?");

        $stmt->bind_param("s", $email);

        $stmt->execute();

        $stmt->store_result();

        if ($stmt->num_rows > 0) {
            // user existed 
            $stmt->close();
            return true;
        } else {
            // user not existed
            $stmt->close();
            return false;
        }
    }
	
	public function CheckExistingUser1($uid) {
        $stmt = $this->conn->prepare("SELECT uid from user WHERE uid = ?");

        $stmt->bind_param("i", $uid);

        $stmt->execute();

        $stmt->store_result();

        if ($stmt->num_rows > 0) {
            // user existed 
            $stmt->close();
            return true;
        } else {
            // user not existed
            $stmt->close();
            return false;
        }
    }

}

?>