<?php
 
/*
 * Following code will list all the products
 */
 
// array for JSON response
$response = array();
 
 if (isset($_GET["username"]) && isset($_GET["phone_number"]) && isset($_GET["user_type"])) {
	 
	$username = $_GET["username"];
	$phone_number = $_GET["phone_number"];
	$user_type = $_GET["user_type"];
	//echo json_encode($response);
	 
	// include db connect class
	$con=mysqli_connect("fdb5.biz.nf","1463364_nemtajo","Gradijent00","1463364_nemtajo");
        mysqli_query( $con,"SET character_set_results = 'utf8', character_set_client = 'utf8', character_set_connection = 'utf8', character_set_database = 'utf8', character_set_server = 'utf8'");

	// insert entry into database table

	$result = mysqli_query($con, "INSERT INTO authority(username, phone_number,user_type) VALUES('$username', '$phone_number', '$user_type')");//(auth_id,username, phone_number,user_type(P,E,F))
	if ($result) {
        // successfully inserted into database
        $response["success"] = 1;
        $response["message"] = "Authority representative successfully created.";
 
        // echoing JSON response
        echo json_encode($response);
    } else {
        // failed to insert row
        $response["success"] = 0;
        $response["message"] = "Oops! An error occurred.";
 
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