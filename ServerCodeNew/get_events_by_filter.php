<?php
 
$fire_event_checked = $_GET["fire_event_checked"];
$police_event_checked = $_GET["police_event_checked"];
$emergency_event_checked = $_GET["emergency_event_checked"];



$description = $_GET["description"];
$begin_time = $_GET["begin_time"];
$end_time = $_GET["end_time"];

$from_date_checked = $_GET["from_date_checked"];
$to_date_checked = $_GET["to_date_checked"];
$radius_checked = $_GET["radius_checked"];
$description_checked = $_GET["description_checked"];

$lat_min = $_GET["lat_min"];
$lng_min = $_GET["lng_min"];
$lat_max = $_GET["lat_max"];
$lng_max = $_GET["lng_max"];

$filter_events = array();
if($fire_event_checked == 1){
    array_push($filter_events, 'F');
}
if($emergency_event_checked == 1){
    array_push($filter_events, 'E');
}
if($police_event_checked == 1){
    array_push($filter_events, 'P');
}

$con=mysqli_connect("fdb5.biz.nf","1463364_nemtajo","Gradijent00","1463364_nemtajo");
        mysqli_query( $con,"SET character_set_results = 'utf8', character_set_client = 'utf8', character_set_connection = 'utf8', character_set_database = 'utf8', character_set_server = 'utf8'");



$query = "SELECT * FROM event WHERE 1=1 ";
if($description_checked == 1)
		$query = $query."AND description LIKE '%$description%' ";
if (!empty($filter_events))
        $query = $query . "AND type_of_event IN ('" . implode('\', \'',$filter_events) ."') " ;                
if($from_date_checked == 1)
		$query = $query."AND event_time >= '$begin_time' ";
if($to_date_checked == 1)
        $query = $query."AND event_time <= '$end_time' ";
if($radius_checked == 1)
		$query = $query."AND lat>='$lat_min' AND lat<='$lat_max' AND lng>='$lng_min' AND lng<='$lng_max'";
                
$result = mysqli_query($con,$query) or die(mysql_error());

$response = array();
$response["success"] = 0;
$response["events"] = array();

 
// check for empty result
if (mysqli_num_rows($result) > 0)
{
    
	$response["success"]=1;
	
    while ($row = mysqli_fetch_array($result)) {
        // temp user array
        $event = array();
	$event["event_id"] = $row["event_id"];
    $event["address"] = $row["address"];
    $event["type_of_event"] = $row["type_of_event"];
    $event["description"] = $row["description"];
    $event["user_phone"] = $row["user_phone"];
	$event["event_time"] = $row["event_time"];
	$event["lng"] = $row["lng"];
	$event["lat"] = $row["lat"];
	$event["location_acc"] = $row["location_acc"];
	$event["anonymous"] = $row["anonymous"];
        
        
    array_push($response["events"], $event);
        
    }
}
    echo json_encode($response);

?>