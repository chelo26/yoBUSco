<?php
 
/*
 * Following code will add the job into database
 */
 
// array for JSON response
$response = array();
 
 if (isset($_GET["registration_id"]) && isset($_GET["auth_username"]) && isset($_GET["auth_type"]) && isset($_GET["auth_phone"])) {
	 
	$registration_id = $_GET["registration_id"];
	$auth_username = $_GET["auth_username"];
	$auth_type = $_GET["auth_type"];
	$auth_phone = $_GET["auth_phone"];
	//echo json_encode($response);
	 
	// include db connect class
	$con=mysqli_connect("fdb5.biz.nf","1463364_nemtajo","Gradijent00","1463364_nemtajo");
        mysqli_query( $con,"SET character_set_results = 'utf8', character_set_client = 'utf8', character_set_connection = 'utf8', character_set_database = 'utf8', character_set_server = 'utf8'");

	// insert entry into database table

	$result = mysqli_query($con, "INSERT INTO gcm_user(registration_id, auth_username,auth_type,auth_phone) VALUES('$registration_id', '$auth_username', '$auth_type', '$auth_phone')");
	if ($result) {
        // successfully inserted into database
        $response["success"] = 1;
        $response["message"] = "User successfully subscribed to push notifications.";
 
        // echoing JSON response
        echo json_encode($response);
    } else {
        // failed to insert row
        $response["success"] = 0;
        $response["message"] = "Failed to register supplied id to cloud services.";
 
        // echoing JSON response
        echo json_encode($response);
    }
} else {
    // required field is missing
    $response["success"] = 0;
    $response["message"] = "Required field(s) is missing";
 
    // echoing JSON response
    echo json_encode($response);
}
var_dump($_GET);
?>