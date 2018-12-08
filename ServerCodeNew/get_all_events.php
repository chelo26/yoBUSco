<?php
 
/*
 * Following code will list all the events
 */
 
// array for JSON response
$response = array();
 
// include db connect class
	$con=mysqli_connect("fdb5.biz.nf","1463364_nemtajo","Gradijent00","1463364_nemtajo");
        mysqli_query( $con,"SET character_set_results = 'utf8', character_set_client = 'utf8', character_set_connection = 'utf8', character_set_database = 'utf8', character_set_server = 'utf8'");

if (isset( $_GET["lat_min"]) && isset($_GET["lng_min"]) && isset($_GET["lat_max"]) && isset($_GET["lng_max"]))
{
// get all events from event table
        $category_fire = "";
        $category_police = "";
        $category_emergency = "";
 
        if( $_GET["category_fire"] == '1' ) $category_fire = "F";//Fire brigade
        if( $_GET["category_police"] == '1' ) $category_police = "P";//Police
        if( $_GET["category_emergency"] == '1' ) $category_emergency = "E";//Emergency
        $lat_min = $_GET["lat_min"];
        $lng_min = $_GET["lng_min"];
        $lat_max = $_GET["lat_max"];
        $lng_max = $_GET["lng_max"];
        $result = mysqli_query($con,"SELECT * FROM event WHERE lat>='$lat_min' AND lat<='$lat_max' AND lng>='$lng_min' AND lng<='$lng_max'AND (type_of_event='$category_fire' OR type_of_event='$category_police' OR type_of_event='$category_emergency')")or die(mysql_error());
// check for empty result
        if (mysqli_num_rows($result) > 0)
        {
    // looping through all results
    // events node
 
	$response["events"] = array();
        $response["success"] = 1;
        $response["message"] = "Event found!";
        
             while ($row = mysqli_fetch_array($result))
             {
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
 
        // push single event into final response array
                array_push($response["events"], $event);
            }

        }  
        else
        {
                $response["success"] = 0;
                $response["message"] = "Event not found!";
        }
}
else
{
        $response["success"] = 0;
        $response["message"] = "Lat and lng not set!";
}
    
echo json_encode($response);

?>		