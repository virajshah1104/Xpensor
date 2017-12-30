<?php

class update_personal_info {

    private $conn;

    // constructor
    function __construct() {
        require_once 'android_login_connect.php';
        // connecting to database
        $db = new android_login_connect();
        $this->conn = $db->connect();
    }

    /**
     * Storing new user
     * returns user details
     */
	 
	 public function GetInfo($uid){
		 		
		$personal1 = array();
		$personal = array();
		$stmt = $this->conn->prepare("SELECT pid FROM personal_gen WHERE uid = ?");
        $stmt->bind_param("i", $uid);
		$stmt->execute();		
        $stmt-> bind_result($token1);
        while ($stmt-> fetch()) {
               $personal1[] = $token1;
            }
            $stmt->close();		
		for($i=0;$i<count($personal1);$i++){	
		$stmt1 = $this->conn->prepare("SELECT name FROM personal_name WHERE pid = ?");
        $stmt1->bind_param("i", $personal1[$i]);
		$stmt1->execute();		
        $stmt1-> bind_result($token2);
        while ( $stmt1-> fetch() ) {
               $personal[] = $token2;
            }
            $stmt1->close();
		}
            return $personal;
	 }
	
    public function StorePersonalInfo($uid, $tname, $tamt, $tdes, $twith, $s_cd, $s_sn) {

        $stmt = $this->conn->prepare("INSERT INTO personal_gen(uid) VALUE (?)");
        $stmt->bind_param("i",$uid);
        $result = $stmt->execute();
        $stmt->close();

        // check for successful store
        if ($result) {
						
		$stmt1 = $this->conn->prepare("SELECT pid FROM personal_gen WHERE uid = ?");
        $stmt1->bind_param("i", $uid);
		$stmt1->execute();		
        $stmt1-> bind_result($token1);
        while ( $stmt1-> fetch() ) {
               $personal["id"] = $token1;
            }
            $stmt1->close();
			$pid = $token1;
			
		$stmt1 = $this->conn->prepare("SELECT name FROM user WHERE uid = ?");
        $stmt1->bind_param("i", $uid);
		$stmt1->execute();		
        $stmt1-> bind_result($token2);
        while ( $stmt1-> fetch() ) {
               $username = $token2;
            }
            $stmt1->close();
			$name1 = $token2;
			
            $stmt = $this->conn->prepare("INSERT INTO personal_name(pid, name, amount, description, with_whom, status_cd, status_sn) VALUES(?,?,?,?,?,?,?) ");
            $stmt->bind_param("isissss", $pid, $tname, $tamt, $tdes, $twith, $s_cd, $s_sn);
            $stmt->execute();
			$stmt->close();
            $personal["created_by"] = $name1;
			$personal["transaction_name"] = $tname;
			$personal["amount"] = $tamt;
			$personal["description"] = $tdes;
			$personal["with"] = $twith;
			$personal["status1"] = $s_cd;
			$personal["status2"] = $s_sn;
			
            return $personal;
        } else {
          return false;
        }
    }
	


}

?>