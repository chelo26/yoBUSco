package com.matesnetwork.callverification;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;
import org.json.JSONException;
import org.json.JSONObject;

import android.content.Context;
import android.os.AsyncTask;
import android.telephony.TelephonyManager;
import android.util.Log;

import it.polimi.guardian.citizenapp.JSONParser;

class ConfirmRegistration extends AsyncTask<String, Void, JSONObject> {
private String sha;
private String app_id;
private String access_token;
private String mobile;
private Context context;

	public ConfirmRegistration(Context context,String tokenId,String sha,String app_id,String mobile) {
       this.access_token=tokenId;
       this.sha=sha;
       this.app_id=app_id;
       this.context=context;
       this.mobile= mobile;
	}

	@Override
	protected void onPreExecute() {
		super.onPreExecute();
	}

	@Override
	protected JSONObject doInBackground(String... params) {
		TelephonyManager tel = (TelephonyManager) context.getSystemService(Context.TELEPHONY_SERVICE);
        String networkOperator = tel.getSimOperator();

        int mcc = 0;
	    if (networkOperator != null) {
	         mcc = Integer.parseInt(networkOperator.substring(0, 3));
            //mcc = 219;

        }
		try {
            List<AbstractMap.SimpleEntry> paramsList = new ArrayList<AbstractMap.SimpleEntry>();
            paramsList.add(new AbstractMap.SimpleEntry("access_token", access_token));
            paramsList.add(new AbstractMap.SimpleEntry("app_id", app_id));
            paramsList.add(new AbstractMap.SimpleEntry("mobile", mobile));
            paramsList.add(new AbstractMap.SimpleEntry("mcc", mcc));
            paramsList.add(new AbstractMap.SimpleEntry("sha", sha));
            String url =Constants.BASE_URL+Constants.CONF_URL;
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
			
			if(result.get("status").equals("success") ) {
				
				Log.d("abx", "confirmation success id:"+result.getString("app_user_id"));
				Methods.setUserId(context, result.getString("app_user_id"));
				Methods.setaccessTok(context, result.getString("access_token"));
				Methods.setappId(context, result.getString("app_id"));
				
			} else 
				if(result.get("status").equals("failed") ) {
					Log.d("abx", "confirmation failed");
					
					
				} 	
		} catch (JSONException e) {
			e.printStackTrace();
		}
	} 
	
}



}
