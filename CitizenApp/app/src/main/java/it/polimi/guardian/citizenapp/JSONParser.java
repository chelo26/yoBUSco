package it.polimi.guardian.citizenapp;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.AbstractMap;
import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;
 
import android.util.Log;

public class JSONParser {
 

 
    // constructor
    public JSONParser() {
 
    }

    // makes HTTP POST or GET method. specify URL and extra parameters, and get JSON object back.
    public static JSONObject makeHttpRequest(String url, String method, List<AbstractMap.SimpleEntry> params) {

        JSONObject jObj =  new JSONObject();
        String json = "";
        // Making HTTP request
        try {
            if(method == "POST"){
                json = performPostCall(url, params);
 
            }else if(method == "GET"){
                json = performGetCall(url, params);
            }
            jObj = parse(json);
 
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jObj;
 
    }

    public static JSONObject parse(String jsonString){
        // try to convert the string into a JSON object
        try {
            return new JSONObject(jsonString);
        } catch (JSONException e) {
            Log.e("JSON Parser", "Error parsing data " + e.toString());
            return new JSONObject();
        }
    }

    public static String  performPostCall(String requestURL,
                                   List<AbstractMap.SimpleEntry> params) {

        URL url;
        String response = "";
        try {
            url = new URL(requestURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setReadTimeout(15000);
            conn.setConnectTimeout(15000);
            conn.setRequestMethod("POST");
            conn.setDoInput(true);
            conn.setDoOutput(true);

            OutputStream os = conn.getOutputStream();
            BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(os, "UTF-8"));
            writer.write(constructUrlArguments(params));

            writer.flush();
            writer.close();
            os.close();
            int responseCode=conn.getResponseCode();

            if (responseCode == HttpURLConnection.HTTP_OK) {
                response = convertStreamToString(conn.getInputStream());
            }
            else {
                response="";

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return response;
    }

    public static String  performGetCall(String requestURL,
                                   List<AbstractMap.SimpleEntry> params) {

        URL url;
        String response = "";
        try {
            requestURL += "?" + constructUrlArguments(params);
            url = new URL(requestURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setReadTimeout(15000);
            conn.setConnectTimeout(15000);
            conn.setRequestMethod("GET");
            conn.setDoInput(true);
            conn.setDoOutput(false);
            conn.connect();
            int responseCode=conn.getResponseCode();
            Log.e("responseCode", responseCode+"");
            String responseMessage = conn.getResponseMessage();
            Log.e("responseMessage", responseMessage);

            if (responseCode == HttpURLConnection.HTTP_OK) {
                response = convertStreamToString(conn.getInputStream());
            }
            else {
                response="";

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return response;
    }

    private static String constructUrlArguments(List<AbstractMap.SimpleEntry> params) throws UnsupportedEncodingException
    {
        StringBuilder result = new StringBuilder();
        boolean first = true;

        for (AbstractMap.SimpleEntry pair : params)
        {
            if (first)
                first = false;
            else
                result.append("&");

            result.append(URLEncoder.encode(pair.getKey().toString(), "UTF-8"));
            result.append("=");
            result.append(URLEncoder.encode(pair.getValue().toString(), "UTF-8"));
        }

        return result.toString();
    }
    public static String convertStreamToString(InputStream is) {
        /*
         * To convert the InputStream to String we use the BufferedReader.readLine()
         * method. We iterate until the BufferedReader return null which means
         * there's no more data to read. Each line will appended to a StringBuilder
         * and returned as String.
         */
        BufferedReader reader = new BufferedReader(new InputStreamReader(is));
        StringBuilder sb = new StringBuilder();

        String line = null;
        try {
            while ((line = reader.readLine()) != null) {
                sb.append(line + "\n");
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                is.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return sb.toString();
    }
}