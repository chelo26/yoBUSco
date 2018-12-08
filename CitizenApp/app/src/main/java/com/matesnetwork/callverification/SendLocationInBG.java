package com.matesnetwork.callverification;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import org.json.JSONException;
import org.json.JSONObject;

import android.content.Context;
import android.os.AsyncTask;
import android.util.Log;

import it.polimi.guardian.citizenapp.JSONParser;


public class SendLocationInBG extends AsyncTask<String, Void, JSONObject> {
	private Context context;
	private String access_token;
	private String app_id;
	private double lat;
	private double lon;
	private String app_user_id;
	boolean locEnable;
	boolean activeEnable;
	public SendLocationInBG(Context context,String access_token,String app_id,String userID,boolean locEnable,boolean activeEnable) {

		this.context = context;
		this.access_token=access_token;
		this.app_id = app_id;
		this.app_user_id=userID;
		this.locEnable=locEnable;
		this.activeEnable=activeEnable;
		if (locEnable) {
			lat=Methods.getLat(context);
			lon=Methods.getLon(context);
		}else{
			lat=0.0;
			lon=0.0;
		}
		
	}
	@Override
	protected void onPreExecute() {
		super.onPreExecute();


	}

	@Override
	protected JSONObject doInBackground(String... arg0) {

		final int TIMEOUT_MILLISEC = 10000;
		try {
			List<AbstractMap.SimpleEntry> paramsList = new ArrayList<AbstractMap.SimpleEntry>();
			paramsList.add(new AbstractMap.SimpleEntry("access_token", access_token));
			paramsList.add(new AbstractMap.SimpleEntry("app_id", app_id));
			paramsList.add(new AbstractMap.SimpleEntry("lat", lat));
			paramsList.add(new AbstractMap.SimpleEntry("lon", lon));
			paramsList.add(new AbstractMap.SimpleEntry("app_user_id", app_user_id));
			paramsList.add(new AbstractMap.SimpleEntry("sha", Methods.getSHA(context)));
			String url = Constants.BASE_URL + Constants.LOCUPDATE_URL;
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
					
					//Log.d("abx", "confirmation success id:"+result.getString("app_user_id"));
					//Methods.setUserId(context, result.getString("app_user_id"));
				    //set alarm here if not already running
					
				} else 
					if(result.get("status").equals("failed") ) {
						Log.d("abx", "confirmation failed");
						
						
					} 	

				
			} catch (JSONException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	private String getDateTimeString() {

		DateFormat formatter = new SimpleDateFormat("ddMMyyyy",Locale.US);

		Calendar calendar = Calendar.getInstance();
		String date = formatter.format(calendar.getTime());

		formatter = new SimpleDateFormat("HHmm",Locale.US);

		String time = formatter.format(calendar.getTime());

		return date.concat(time);
	}
}
	
	
