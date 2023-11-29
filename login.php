<?php 
session_start(); 
include "config.php";

if (isset($_POST['Username']) && isset($_POST['Password'])) {

	// function validate($data){
    //    $data = trim($data);
	//    $data = stripslashes($data);
	//    $data = htmlspecialchars($data);
	//    return $data;
	// }

	// $uname = validate($_POST['Username']);
	// $pass = validate($_POST['Password']);

	$uname = $_POST['Username'];
	$pass = $_POST['Password'];
	$sql = "SELECT * FROM users WHERE username='$uname'";

	$result = mysqli_query($con, $sql);

	if (mysqli_num_rows($result) === 1) {
		$row = mysqli_fetch_assoc($result);
        if (password_verify($pass, $row['pwd'])) {
            header("Location: index.php");
		    exit();
        }else{
			header("Location: register.php?error=Incorect Username or Password");
		    exit();
		}
	}else{
		header("Location: register.php?error=Incorect Username or Password");
	    exit();
	}
	
}else{
	header("Location: register.php");
	exit();
}

$con->close();