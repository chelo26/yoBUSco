<?php
 
/*
 * Following code will list all the products
 */
 
// array for JSON response
$response = array();
 
 if (isset($_GET["longitude"]) && isset($_GET["latitude"]) && isset($_GET["address"]) && isset($_GET["category"]) && isset($_GET["description"]) && isset($_GET["username"]) && isset($_GET["time"])) {
	
	$longitude = $_GET["longitude"];
	$latitude = $_GET["latitude"];	
	$address = $_GET["address"];
	$category = $_GET["category"];
	$description = $_GET["description"];
	$username = $_GET["username"];
	$time = $_GET["time"];
	 
	// include db connect class
	$con=mysqli_connect("mysql4.000webhost.com","a1762635_nikolam","nikolamilica10","a1762635_nikolam");
mysqli_query( $con,"SET character_set_results = 'utf8', character_set_client = 'utf8', character_set_connection = 'utf8', character_set_database = 'utf8', character_set_server = 'utf8'");

	$result = mysqli_query($con, "INSERT INTO markers(address, category, description, username, time, longitude, latitude) VALUES('$address', '$category', '$description', '$username', '$time', '$longitude', '$latitude')");
	
	if ($result) {
        // successfully inserted into database
        $response["success"] = 1;
        $response["message"] = "Marker successfully created.";
    
        $result = mysqli_query($con,"SELECT * FROM markers WHERE longitude=$longitude AND latitude=$latitude")or die(mysql_error());
 
        $row = mysqli_fetch_array($result);
        $response["id"] = $row["ID"];

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