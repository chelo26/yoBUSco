<?php
 require_once 'gcm_functions.php';
/*
 * Following code will list all the products
 */
 
// array for JSON response
$response = array();
 
 if (isset($_GET["lat"]) && isset($_GET["lng"]) && isset($_GET["description"]) && isset($_GET["event_time"]) && isset($_GET["location_acc"]) && isset($_GET["type_of_event"]) && isset($_GET["user_phone"]) && isset($_GET["anonymous"]) && isset($_GET["address"])) {

	$lat = $_GET["lat"];
	$lng = $_GET["lng"];
	$description = $_GET["description"];
	$event_time = $_GET["event_time"];
	$location_acc = $_GET["location_acc"];
	$type_of_event = $_GET["type_of_event"];
	$user_phone = $_GET["user_phone"];
	$anonymous = $_GET["anonymous"];
	$address = $_GET["address"];
	
	 
	// include db connect class
	$con=mysqli_connect("fdb5.biz.nf","1463364_nemtajo","Gradijent00","1463364_nemtajo");
        mysqli_query( $con,"SET character_set_results = 'utf8', character_set_client = 'utf8', character_set_connection = 'utf8', character_set_database = 'utf8', character_set_server = 'utf8'");

	$result = mysqli_query($con, "INSERT INTO event(lat, lng, description, event_time, location_acc, type_of_event, user_phone, anonymous, address) VALUES('$lat', '$lng', '$description', '$event_time', '$location_acc','$type_of_event', '$user_phone', '$anonymous', '$address')");
	
	if ($result) {
        // successfully inserted into database
        $response["success"] = 1;
        $response["message"] = "Event successfully created.";
    
        $result = mysqli_query($con,"SELECT * FROM event WHERE lng=$lng AND lat=$lat")or die(mysql_error());
 
        $row = mysqli_fetch_array($result);
        $response["id"] = $row["ID"];
		
		//send push nots. to all gcm_users with type type_of_event
		$gcm_users = getAllGcmUsers($type_of_event);
		foreach($gcm_users as $user){
		   sendMessageThroughGCM($user["registration_id"],$lat+'&'+$lng+'&'+$description'&'+$event_time+'&'+$location_acc+'&'+$type_of_event+'&'+$user_phone+'&'+$anonymous+'&'+$address) ;
		}


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