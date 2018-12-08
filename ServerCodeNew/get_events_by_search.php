<?php
 
$address = $_GET["address"];

$category = $_GET["category"];

$description = $_GET["description"];

$username = $_GET["username"];

$begintime = $_GET["begintime"];

$endtime = $_GET["endtime"];

$username_comment = $_GET["username_comment"];

$comment = $_GET["comment"];

$date_checked = $_GET["date_checked"];
$comment_checked= $_GET["comment_checked"];



$con=mysqli_connect("mysql4.000webhost.com","a1762635_nikolam","nikolamilica10","a1762635_nikolam");
mysqli_query( $con,"SET character_set_results = 'utf8', character_set_client = 'utf8', character_set_connection = 'utf8', character_set_database = 'utf8', character_set_server = 'utf8'");

if( $comment_checked == 1 )
{
if( $date_checked == 1 ) $result = mysqli_query($con,"SELECT * FROM markers WHERE ID in ( SELECT id_marker FROM comments WHERE (username_comment LIKE '%$username_comment%') AND (comment LIKE '%$comment%') ) AND (address LIKE '%$address%') AND (category LIKE '%$category%') AND (description LIKE '%$description%') AND (username LIKE '%$username%') AND (time BETWEEN '$begintime' AND '$endtime')")or die(mysql_error());
else $result = mysqli_query($con,"SELECT * FROM markers WHERE ID in ( SELECT id_marker FROM comments WHERE (username_comment LIKE '%$username_comment%') AND (comment LIKE '%$comment%') ) AND (address LIKE '%$address%') AND (category LIKE '%$category%') AND (description LIKE '%$description%') AND (username LIKE '%$username%')")or die(mysql_error());
}
else
{
if( $date_checked == 1 ) $result = mysqli_query($con,"SELECT * FROM markers WHERE (address LIKE '%$address%') AND (category LIKE '%$category%') AND (description LIKE '%$description%') AND (username LIKE '%$username%') AND (time BETWEEN '$begintime' AND '$endtime')")or die(mysql_error());
else $result = mysqli_query($con,"SELECT * FROM markers WHERE  (address LIKE '%$address%') AND (category LIKE '%$category%') AND (description LIKE '%$description%') AND (username LIKE '%$username%')")or die(mysql_error());
}
//$result = mysqli_query($con,"SELECT * FROM markers WHERE time BETWEEN '$begintime' AND '$endtime'")or die(mysql_error());



// array for JSON response
$response = array();


$response["success"] = 1;

$response["markers"] = array();
 
// check for empty result
if (mysqli_num_rows($result) > 0) {
    // looping through all results
    // products node
 
    while ($row = mysqli_fetch_array($result)) {
        // temp user array
        $marker = array();
        $marker["address"] = $row["address"];
        $marker["category"] = $row["category"];
        $marker["description"] = $row["description"];
        $marker["username"] = $row["username"];
		$marker["time"] = $row["time"];
		$marker["longitude"] = $row["longitude"];
		$marker["latitude"] = $row["latitude"];
 
        // push single product into final response array
        array_push($response["markers"], $marker);
    }

}
    echo json_encode($response);

?>		