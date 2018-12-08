package com.matesnetwork.callverification;

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

import it.polimi.guardian.citizenapp.JSONParser;

public class AuthenticateToken extends AsyncTask<String, Void, JSONObject> {
    AuthenticateListner verifyTokenListner;
    String sha;
    String app_id;
    String access_token;
    String mcc;
    Context context;
    protected interface AuthenticateListner {
        //public String onVerifyStart();
        public String[] onVerifySucess(String[] numberArray);
        public String onVerifyFailed(ArrayList<String> errorList);
    }

    public AuthenticateToken(Context context,String tokenId,String sha,String app_id,AuthenticateListner verifyTokenListner) {
        this.verifyTokenListner = verifyTokenListner;
        this.access_token=tokenId;
        this.sha=sha;
        this.app_id=app_id;
        this.context=context;
    }

    @Override
    protected void onPreExecute() {
        super.onPreExecute();
    }

    @Override
    protected JSONObject doInBackground(String... params) {
        TelephonyManager tel = (TelephonyManager) context.getSystemService(Context.TELEPHONY_SERVICE);
        String networkOperator = tel.getNetworkOperator();
        int mcc = 0;
        if (networkOperator != null) {
            mcc = Integer.parseInt(networkOperator.substring(0, 3));
            // int mnc = Integer.parseInt(networkOperator.substring(3));
        }
        try {
            List<AbstractMap.SimpleEntry> paramsList = new ArrayList<AbstractMap.SimpleEntry>();
            paramsList.add(new AbstractMap.SimpleEntry("access_token", access_token));
            paramsList.add(new AbstractMap.SimpleEntry("app_id", app_id));
            paramsList.add(new AbstractMap.SimpleEntry("mcc", mcc));
            paramsList.add(new AbstractMap.SimpleEntry("sha", sha));
            String url =Constants.BASE_URL+Constants.AUTH_URL;
            JSONObject jObj = JSONParser.makeHttpRequest(url,"GET", paramsList);
            return jObj;

        }  catch (Exception e) {
            return null;
        }

    }
    @Override
    protected void onPostExecute(JSONObject result) {

        super.onPostExecute(result);

        if (result != null) {

            try {

                if(result.get("status").equals("success") ) {

                    Log.d("abx", "success");
                    if (result.has("numbers")) {
                        JSONArray jNumber=result.getJSONArray("numbers");
                        String[] stringarray = new String[jNumber.length()]; //{"",""};//jsonArray.t;

                        for (int i=0;i<jNumber.length();i++) {
                            stringarray[i]=	jNumber.getString(i);
                        }
                        verifyTokenListner.onVerifySucess(stringarray);
                    }

                } else
                if(result.get("status").equals("failed") ) {
                    Log.d("abx", "failed");
                    ArrayList<String> errorList = new ArrayList<String>();
                    JSONArray jsonArray = result.getJSONArray("codes");
                    if (jsonArray != null) {
                        int len = jsonArray.length();
                        for (int i=0;i<len;i++){
                            errorList.add(jsonArray.get(i).toString());
                        }
                    }
                    verifyTokenListner.onVerifyFailed(errorList);

                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
        } else{

        }

    }

}
