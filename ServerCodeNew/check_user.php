<?php
 
/*
 * Following code will list all the products
 */
 
// array for JSON response
$response = array();
 
$phone_number = $_POST["phone_number"];
$username = $_POST["username"];
// array for JSON response
$response = array();
 
// include db connect class
$con=mysqli_connect("fdb5.biz.nf","1463364_nemtajo","Gradijent00","1463364_nemtajo");
 
// get all users from user table
$result = mysqli_query($con,"SELECT * FROM user")or die(mysql_error());

$response["success"] = 1;
 
// check for empty result
if (mysqli_num_rows($result) > 0) {
    // looping through all results
    // users node
 
    while ($row = mysqli_fetch_array($result)) {
        // temp user array
     
        if(( $phone_number == $row["phone_number"] ) and ( $username == $row["username"] ))
		{
			$response["success"] = 0;//0 is for "already exists in database"
                        //echo json_encode($row);
			break;
		}
		
    }
}
    echo json_encode($response);

?>	
