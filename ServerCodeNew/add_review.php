<?php
 
/*
 * Following code will add the review into database
 */
 
// array for JSON response
$response = array();

 if (isset($_GET["auth_username"]) && isset($_GET["event_id"]) && isset($_GET["job_type"]) && isset($_GET["job_status"]) && isset($_GET["review_creation_time"])) {
	 
	$auth_username = $_GET["auth_username"];
	$event_id = $_GET["event_id"];
	$job_type = $_GET["job_type"];
	$job_status = $_GET["job_status"];
	$review_creation_time = $_GET["review_creation_time"];
	//echo json_encode($response);
	 
	// include db connect class
	$con=mysqli_connect("fdb5.biz.nf","1463364_nemtajo","Gradijent00","1463364_nemtajo");
        mysqli_query( $con,"SET character_set_results = 'utf8', character_set_client = 'utf8', character_set_connection = 'utf8', character_set_database = 'utf8', character_set_server = 'utf8'");

	// insert entry into database table
	
	$result = mysqli_query($con, "INSERT INTO review(auth_username, event_id,job_type, job_status, review_creation_time) VALUES('$auth_username', '$event_id', '$job_type', '$job_status', '$review_creation_time')");
	if ($result) {
        // successfully inserted into database
        $response["success"] = 1;
        $response["message"] = "Review successfully created.";
 
        // echoing JSON response
        echo json_encode($response);
    } else {
        // failed to insert row
        $response["success"] = 0;
        $response["message"] = "Failed to save review.";
 
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