<?php

$type = $_GET["user_type"];

$con=mysqli_connect("fdb5.biz.nf","1463364_nemtajo","Gradijent00","1463364_nemtajo");
        mysqli_query( $con,"SET character_set_results = 'utf8', character_set_client = 'utf8', character_set_connection = 'utf8', character_set_database = 'utf8', character_set_server = 'utf8'");

$query1 = "SELECT DISTINCT auth_username FROM review WHERE job_type='$type'";
 
$auth = mysqli_query($con,$query1) or die(mysql_error());

$response = array();
$response["user_num_jobs"] = array();
$response["success"]=0;

if (mysqli_num_rows($auth) > 0)
{
	$response["success"]=1;
	while ($row = mysqli_fetch_array($auth))
		{
				$username = $row["auth_username"];
				$query2 = "SELECT * FROM review WHERE job_type = '$type' AND auth_username = '$username'";
				$result = mysqli_query($con,$query2) or die(mysql_error());
				$num_jobs = $result->num_rows;
				
				$obj=array();
				$obj["username"] = $username;
				$obj["num_jobs"] = $num_jobs; 
				
				array_push($response["user_num_jobs"], $obj);
		}
 

}
    echo json_encode($response);

?>