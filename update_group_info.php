<?php

class update_group_info {

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
	
    public function StoreGroupInfo($uid, $gname) {

        $stmt = $this->conn->prepare("INSERT INTO group_gen(uid) VALUE (?)");
        $stmt->bind_param("i",$uid);
        $result = $stmt->execute();
        $stmt->close();

        // check for successful store
        if ($result) {
						
		$stmt1 = $this->conn->prepare("SELECT gid FROM group_gen WHERE uid = ?");
        $stmt1->bind_param("i", $uid);
		$stmt1->execute();		
        $stmt1-> bind_result($token1);
        while ( $stmt1-> fetch() ) {
               $group["id"] = $token1;
            }
            $stmt1->close();
			$gid = $token1;
			
		$stmt1 = $this->conn->prepare("SELECT name FROM user WHERE uid = ?");
        $stmt1->bind_param("i", $uid);
		$stmt1->execute();		
        $stmt1-> bind_result($token2);
        while ( $stmt1-> fetch() ) {
               $username = $token2;
            }
            $stmt1->close();
			$name1 = $token2;
			
            $stmt = $this->conn->prepare("INSERT INTO group_name(gid, name, created_by) VALUES(?,?,?) ");
            $stmt->bind_param("iss", $gid, $gname, $name1);
            $stmt->execute();
			$stmt->close();
            $group["name"] = $gname;
            $group["create"] = $name1;
            return $group;
        } else {
          return false;
        }
    }
	


}

?>