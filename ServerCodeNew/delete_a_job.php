<?php
 
/*
 * Following code will delte the job from database
 */
 
// array for JSON response
$response = array();
 
 if (isset($_GET["event_id"])) {
	$event_id = $_GET["event_id"];
	//echo json_encode($response);
	 
	// include db connect class
	$con=mysqli_connect("fdb5.biz.nf","1463364_nemtajo","Gradijent00","1463364_nemtajo");
        mysqli_query( $con,"SET character_set_results = 'utf8', character_set_client = 'utf8', character_set_connection = 'utf8', character_set_database = 'utf8', character_set_server = 'utf8'");

	// delete entry from database table

	mysqli_query($con, "DELETE FROM job  WHERE event_id='$event_id'");
	$num = mysql_affected_rows();
	if ($num) {
        // successfully deleted from database
        $response["success"] = 1;
        $response["message"] = "Job successfully deleted.";
 
        // echoing JSON response
        echo json_encode($response);
    } else {
        // failed to delete a row
        $response["success"] = 0;
        $response["message"] = "That job is already taken. Please refresh the list of jobs.";
 
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