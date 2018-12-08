<?php
 
/*
 * Following code will list all the products
 */
 
 $id_event = $_GET["id_event"];
// array for JSON response
$response = array();
 
// include db connect class
$con=mysqli_connect("fdb5.biz.nf","1463364_nemtajo","Gradijent00","1463364_nemtajo");
        mysqli_query( $con,"SET character_set_results = 'utf8', character_set_client = 'utf8', character_set_connection = 'utf8', character_set_database = 'utf8', character_set_server = 'utf8'");

// get all products from products table
$result = mysqli_query($con,"SELECT * FROM comments WHERE id_event=$id_event")or die(mysql_error());

$response["success"] = 1;
 
// check for empty result
if (mysqli_num_rows($result) > 0) {
    // looping through all results
    // products node
 
	$response["comments"] = array();
 
     while ($row = mysqli_fetch_array($result)) {
        // temp user array
        $comment = array();
		$comment["id"] = $row["id"];
        $comment["id_event"] = $row["id_event"];
        $comment["username"] = $row["username"];
        $comment["comment_date"] = $row["comment_date"];
		$comment["comment_text"] = $row["comment_text"];
 
        // push single product into final response array
        array_push($response["comments"], $comment);
    }

}
else
{
$response["success"] = 0;
}
echo json_encode($response);

?>		