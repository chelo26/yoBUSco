<?php
 
$username = $_POST["username"];
$password = $_POST["password"];
//also sign in needs to be done through phone number, not username

// array for JSON response
$response = array();
 
// include db connect class
$con=mysqli_connect("fdb5.biz.nf","1463364_nemtajo","Gradijent00","1463364_nemtajo");
mysqli_query( $con,"SET character_set_results = 'utf8', character_set_client = 'utf8', character_set_connection = 'utf8', character_set_database = 'utf8', character_set_server = 'utf8'");
  
// get all users from user table
$result = mysqli_query($con,"SELECT * FROM user")or die(mysql_error());

$response["success"]=0;

// check for empty result
if (mysqli_num_rows($result) > 0) {
    // looping through all results
    // users node
 
    while ($row = mysqli_fetch_array($result)) {
        // temp user array
		if($row["username"]==$username )
		{
			$response["success"]=1;
			$response["name"]=$row["name"];
			$response["phone_number"]=$row["phone_number"];
		}
     
    }
}
    echo json_encode($response);

?>	
			