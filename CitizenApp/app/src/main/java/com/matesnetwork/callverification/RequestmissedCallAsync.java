package com.matesnetwork.callverification;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.content.Context;
import android.os.AsyncTask;
import android.telephony.TelephonyManager;
import android.util.Log;

import com.matesnetwork.callverification.CallListnerHelper.CallHelperListner;

import it.polimi.guardian.citizenapp.JSONParser;

public class RequestmissedCallAsync extends AsyncTask<String, Void, JSONObject> {
	RequestMissedCallListnr requestMissedCallListner;
	Context context;
	String sha;
	String app_id;
	String access_token;
	String mobnumber;
	CallListnerHelper callListnerHelper;
	String[] numberArray;
    double lat;
    double lon;
	protected interface RequestMissedCallListnr {
		public String onRequestStart();

		public String[] onRequestSucess(String numb[]);

		public String onRequestFailed(ArrayList<String>  errorCodeList);
		public void onNumberVerified();
		public void onNumberNotVerified(ArrayList<String>  errorCodeList);
	}

	public RequestmissedCallAsync(Context context, String tokenId, String sha,
			String app_id, String mobnumber ,String[] numberArray,RequestMissedCallListnr requestMissedCallListner) {
		this.requestMissedCallListner = requestMissedCallListner;
		this.context = context;
		this.access_token = tokenId;
		this.sha = sha;
		this.app_id = app_id;
		this.mobnumber=mobnumber;
		this.numberArray=numberArray;
		lat=Methods.getLat(context);
		lon=Methods.getLon(context);
	}

	@Override
	protected void onPreExecute() {
		requestMissedCallListner.onRequestStart();
		super.onPreExecute();
	}

	@Override
	protected JSONObject doInBackground(String... params) {

		TelephonyManager tel = (TelephonyManager) context.getSystemService(Context.TELEPHONY_SERVICE);
        String networkOperator = tel.getSimOperator();


        int mcc = 0;
		if (networkOperator != null) {
			mcc = Integer.parseInt(networkOperator.substring(0, 3));
			int mnc = Integer.parseInt(networkOperator.substring(3));
           // mcc = 219;
		}
		try {
            List<AbstractMap.SimpleEntry> paramsList = new ArrayList<AbstractMap.SimpleEntry>();
            paramsList.add(new AbstractMap.SimpleEntry("access_token", access_token));
            paramsList.add(new AbstractMap.SimpleEntry("app_id", app_id));
            paramsList.add(new AbstractMap.SimpleEntry("imei", Methods.getImei(context)));
            paramsList.add(new AbstractMap.SimpleEntry("brand_name", Methods.getDeviceName().replace(" ", "%20")));
            paramsList.add(new AbstractMap.SimpleEntry("model_number", Methods.getDeviceModelNumber().replace(" ", "%20")));
            paramsList.add(new AbstractMap.SimpleEntry("os_version", Methods.getOSVersion().replace(" ", "%20")));
            paramsList.add(new AbstractMap.SimpleEntry("gmail_id", Methods.getEmail(context)));
            paramsList.add(new AbstractMap.SimpleEntry("lat", lat));
            paramsList.add(new AbstractMap.SimpleEntry("lon", lon));
            paramsList.add(new AbstractMap.SimpleEntry("mcc", mcc));
            paramsList.add(new AbstractMap.SimpleEntry("mobile", mobnumber));
            paramsList.add(new AbstractMap.SimpleEntry("sha", sha));
            String url = Constants.BASE_URL + Constants.REQ_URL;
            JSONObject jObj = JSONParser.makeHttpRequest(url, "GET", paramsList);
            return jObj;
		} catch (Exception e) {
			return null;
		}

	}

	@Override
	protected void onPostExecute(JSONObject result) {
		
		super.onPostExecute(result);

		if (result != null) {

			try {

				if (result.get("status").equals("success")) {
					
					String[] stringarray = null;
					Log.d("abx", "request missed call sucess ");
	                callListnerHelper= new CallListnerHelper(context, numberArray, new CallHelperListner() {
							
							@Override
							public void onVerificationSucess() {
								callListnerHelper.stop();
								requestMissedCallListner.onNumberVerified();
							}
							
							@Override
							public void onVerificationFailed() {
								callListnerHelper.stop();
								 ArrayList<String> errorCode = new ArrayList<String>();
								   errorCode.add("605");
								
								requestMissedCallListner.onNumberNotVerified(errorCode);
							}
						});
	                callListnerHelper.start();
					requestMissedCallListner.onRequestSucess(stringarray);
					
				} else if (result.get("status").equals("failed")) {
					
					ArrayList<String> errorList = new ArrayList<String>();     
					JSONArray jsonArray = result.getJSONArray("codes"); 
					if (jsonArray != null) { 
					   int len = jsonArray.length();
					   for (int i=0;i<len;i++){ 
						   errorList.add(jsonArray.get(i).toString());
					   } 
					} 
					requestMissedCallListner.onRequestFailed(errorList);

				}
			} catch (JSONException e) {
				e.printStackTrace();
			}
		}else{
			 ArrayList<String> errorCode = new ArrayList<String>();
			   errorCode.add("606");
			requestMissedCallListner.onNumberNotVerified(errorCode);
		}

	}
}
