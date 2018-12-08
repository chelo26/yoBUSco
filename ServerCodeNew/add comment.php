<?php
 
/*
 * Following code will list all the products
 */
 
// array for JSON response
$response = array();
 
 if (isset($_GET["id_event"]) && isset($_GET["username"]) && isset($_GET["comment_date"]) && isset($_GET["comment_text"]) ) {
	
	$id_event = $_GET["id_event"];
	$username = $_GET["username"];	
	$comment_date = $_GET["comment_date"];
	$comment_text = $_GET["comment_text"];
	 
	// include db connect class
	$con=mysqli_connect("fdb5.biz.nf","1463364_nemtajo","Gradijent00","1463364_nemtajo");
        mysqli_query( $con,"SET character_set_results = 'utf8', character_set_client = 'utf8', character_set_connection = 'utf8', character_set_database = 'utf8', character_set_server = 'utf8'");
	// get all products from products table
	$result = mysqli_query($con, "INSERT INTO comment(id_event, username, comment_date, comment_text) VALUES('$id_event', '$username', '$comment_date', '$comment_text')");
	
	if ($result) {
        // successfully inserted into database
        $response["success"] = 1;
        $response["message"] = "Comment successfully created.";
		
        $id = mysqli_insert_id($con);
        $response["id"] = $id;
 
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
?>	