<?php
 
/*
 * Following code will list all the events
 */
 
// array for JSON response
$response = array();
 
// include db connect class
	$con=mysqli_connect("fdb5.biz.nf","1463364_nemtajo","Gradijent00","1463364_nemtajo");
        mysqli_query( $con,"SET character_set_results = 'utf8', character_set_client = 'utf8', character_set_connection = 'utf8', character_set_database = 'utf8', character_set_server = 'utf8'");

if (isset( $_GET["type"]))
{
	$type = $_GET["type"];
	// get all events from event table
	$result = mysqli_query($con,"SELECT * FROM event WHERE type_of_event='$type'")or die(mysql_error()); //AND event_id NOT IN (SELECT event_id FROM job)
	$response["success"] = 0;
	 
	// check for empty result
	if (mysqli_num_rows($result) > 0) {
		// looping through all results
		// products node
		$response["success"] = 1;
		$response["events"] = array();
	 
		while ($row = mysqli_fetch_array($result)) {
			// temp user array
			$event = array();
			$event["event_id"] = $row["event_id"];
			$event["lat"] = $row["lat"];
			$event["lng"] = $row["lng"];
			$event["description"] = $row["description"];
			$event["event_time"] = $row["event_time"];
			$event["location_acc"] = $row["location_acc"];
			$event["type_of_event"] = $row["type_of_event"];
			$event["user_phone"] = $row["user_phone"];
			$event["anonymous"] = $row["anonymous"];
			$event["address"] = $row["address"];
	 
			// push single product into final response array
			array_push($response["events"], $event);
		}
	}
	else
	{
                $response["success"] = 0;
                $response["message"] = "There are no such events in database!";
	}
}
else
{
        $response["success"] = 0;
        $response["message"] = "type parameter not set!";
}
    echo json_encode($response);

?>			