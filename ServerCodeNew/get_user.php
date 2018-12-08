<?php
 
$username = $_GET["username"];

// array for JSON response
$response = array();
 
// include db connect class
$con=mysqli_connect("fdb5.biz.nf","1463364_nemtajo","Gradijent00","1463364_nemtajo");
mysqli_query( $con,"SET character_set_results = 'utf8', character_set_client = 'utf8', character_set_connection = 'utf8', character_set_database = 'utf8', character_set_server = 'utf8'");

 
// get all users from user table
$result = mysqli_query($con,"SELECT * FROM user WHERE username='$username'")or die(mysql_error());



if (mysqli_num_rows($result) > 0) {

	$row = mysqli_fetch_array($result);
	
	$response["success"]=1;
	$response["phone_number"]=$row["phone_number"];
	$response["username"]=$row["username"];
	$response["password"]=$row["password"];
}
else
 $response["success"]=0;

echo json_encode($response);

?>		