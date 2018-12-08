<?php
if (!function_exists('curl_init')) {
    require_once 'purl/Purl.php';				//https://github.com/azayarni/purl
}
//Sending Push Notification
   function sendMessageThroughGCM($registration_ids, $message) {
		//Google cloud messaging GCM-API url
        $url = 'https://android.googleapis.com/gcm/send';
        $fields = array(
            'registration_ids' => array($registration_ids),
            'data' => array("message" => $message),
        );
		// Update your Google Cloud Messaging API Key
		define("GOOGLE_API_KEY", "AIzaSyCdjANabdwHl_9akWEOCbT9bVEKV5cNhlQ"); 		
        $headers = array(
            'Authorization: key=' . GOOGLE_API_KEY,
            'Content-Type: application/json'
        );
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		curl_setopt ($ch, CURLOPT_SSL_VERIFYHOST, 0);	
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fields));
        $result = curl_exec($ch);				
        if ($result === FALSE) {
            die('Curl failed: ' . curl_error($ch));
        }
        curl_close($ch);
        return $result;
    }
	function getAllGcmUsers($userType) {
		// include db connect class
		$con=mysqli_connect("fdb5.biz.nf","1463364_nemtajo","Gradijent00","1463364_nemtajo");
        mysqli_query( $con,"SET character_set_results = 'utf8', character_set_client = 'utf8', character_set_connection = 'utf8', character_set_database = 'utf8', character_set_server = 'utf8'");
		$result = mysqli_query($con,"SELECT * FROM gcm_user WHERE auth_type='$userType'")or die(mysql_error());
		for ($set = array (); $row = $result->fetch_assoc(); $set[] = $row);
		
        return $set;
	}
	//var_dump(sendMessageThroughGCM("APA91bH1jlLRPL694kJf6yQN-f_LMJcB-NrtHIaniIqBNcX7g-cygh9RP2BueJ6flt1H1DeNsOi_ONfIRtJvHfDKl3YhjQDvZzx-DVSKzKi2EpU0-eaSj3tFYdkvhaphFKFYuKurN9ETX-pfB4oJo3M5qCQRZxJGGA", "hey"));
	//var_dump(sendMessageThroughGCM("APA91bGzz01z6Du3wkh2N-rkXUDvHBK6v8lMRW3uIn-E0ESLblCKmEGYz68CAhbuWJQYNjbZ2f5veWihtmUYLOSUZW2QuXGOR-5QBQtvuwrPZs3S8VpTbhzE0dORLfSA4kOKK8SNhnHOvzKDbMYTzEhDJTX7Vz7ROA", "hey"));
	
	//getAllGcmUsers("E");
?>