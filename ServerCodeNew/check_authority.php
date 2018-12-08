<?php
 
/*
 * Following code will check the existence of a phone number inside authority table
 */
 
// array for JSON response
$response = array();
 
$phone_number = $_POST["phone_number"];
// array for JSON response
$response = array();
 
// include db connect class
$con=mysqli_connect("fdb5.biz.nf","1463364_nemtajo","Gradijent00","1463364_nemtajo");
 
// get all users from authority table
$result = mysqli_query($con,"SELECT * FROM authority")or die(mysql_error());

$response["success"] = 1;
 
// check for empty result
if (mysqli_num_rows($result) > 0) {
    // looping through all results
    // users node
 
    while ($row = mysqli_fetch_array($result)) {
        // temp authority array
     
        if( $phone_number == $row["phone_number"] )
		{
			$response["success"] = 0;//0 is for "already exists in database"
                        //echo json_encode($row);
			break;
		}
		
    }
}
    echo json_encode($response);

?>	
