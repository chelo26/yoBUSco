package it.polimi.guardian.citizenapp;

import android.content.Intent;
import android.location.Location;
import android.location.LocationListener;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.CheckBox;
import android.widget.Toast;

import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.GoogleMap.OnMarkerClickListener;
import com.google.android.gms.maps.OnMapReadyCallback;
import com.google.android.gms.maps.SupportMapFragment;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.MarkerOptions;
import com.google.android.gms.maps.model.VisibleRegion;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.List;

import Services.LocationService;

public class PGMapActivity extends FragmentActivity implements OnMarkerClickListener, OnMapReadyCallback, GoogleMap.OnCameraChangeListener, LocationListener
{


	GoogleMap mapa;
    boolean asyncTaskInProgress = false;

	Marker markers[];
	int finishedTask = 0;
    int refresh= 1;

	double lat;
    double lng;
    double lng_min;
    double lat_max;
    double lng_max;
    double lat_min;

    CheckBox cb_fire;
    CheckBox cb_police;
    CheckBox cb_emergency;


    JSONArray markers_response = null;
    LocationService locationService = null;

    Tags t = new Tags();

    @Override
	protected void onCreate(Bundle savedInstanceBundle) {

        // TODO Auto-generated method stub
        super.onCreate(savedInstanceBundle);
        setContentView(R.layout.pgmap_activity);

        ((SupportMapFragment) (getSupportFragmentManager().findFragmentById(R.id.mapf))).getMapAsync(this);
        locationService = LocationService.getLocationManager(this);
    }

    public void PositionOnMap()
    {

            LatLng latLng = new LatLng(lat,lng);
            mapa.animateCamera(CameraUpdateFactory.newLatLngZoom(latLng, 15));


		try {
            checkLocationPermissions();
			mapa.setMyLocationEnabled(true);
		} catch (SecurityException e) {
			Toast.makeText(this, "App requires location access permissions", Toast.LENGTH_SHORT); // lets the user know there is a problem with the gps
		}

    }
		@Override
		public boolean onMarkerClick(com.google.android.gms.maps.model.Marker marker) {
			
			Intent i = new Intent(PGMapActivity.this,MarkerActivity.class);
			Marker m = new Marker();
			
			String[] niz = new String[7];
			String snip = marker.getSnippet();
			niz = snip.split("&");
			
			m.id = niz[6];
			m.setType_of_event(marker.getTitle());
			m.setUser_phone(niz[0]);
			m.setAddress(niz[1]);
			m.setEvent_time(niz[2]);
            m.setAnonymous(Integer.parseInt(niz[3]));
            m.setLocation_acc(Float.parseFloat(niz[4]));
			m.setDescription(niz[5]);
			m.setLat(marker.getPosition().latitude);
			m.setLng(marker.getPosition().longitude);

			i.putExtra("marker", m);
			startActivity(i);
			return true;// returns true to cancel default behaviour of the marker... so that it doesn't show info window of the marker
		}
	
	@Override 
	protected void onRestart()
	{
		super.onRestart();
		if(refresh==1)
		{
			new GetMarkersByCategory().execute();
		}
	}
	
	
	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.pgmap_menu, menu);



        new GetMarkersByCategory().execute();
        return super.onCreateOptionsMenu(menu);
	}
	
	@Override
	public boolean onOptionsItemSelected(MenuItem item) {

		switch(item.getItemId())
		{
			case R.id.refresh_events:
				refresh = 1;
                cb_fire.setChecked(true);
                cb_police.setChecked(true);
                cb_emergency.setChecked(true);
                onRestart();
				break;
			case R.id.filter_events:
				Intent i = new Intent(PGMapActivity.this,FilterActivity.class);
				startActivityForResult(i, 1);
				break;

		}
		return super.onOptionsItemSelected(item);
	}

    public void onCheckboxClicked(View v) {
        // Check which checkbox was clicked
        switch (v.getId()) {
            case R.id.cb_fire:
            case R.id.cb_police:
            case R.id.cb_emergency:
                refresh = 1;
                onRestart();
                break;
        }

    }

        @Override
	protected void onActivityResult(int requestCode, int resultCode, Intent data) {
		// TODO Auto-generated method stub
		super.onActivityResult(requestCode, resultCode, data);
		if(resultCode==RESULT_OK)
		{
			refresh=0;
			DataWrapper dw = (DataWrapper) data.getSerializableExtra("markers");
	        markers = dw.getMarkers();
            DrawMarkers();
		}
	}

	@Override
	protected void onResume()
	{
		// TODO Auto-generated method stub
		super.onResume();

	}

	private void DrawMarkers() {

		SupportMapFragment mapFragment = (SupportMapFragment) getSupportFragmentManager().findFragmentById(R.id.mapf);
		mapFragment.getMapAsync(this);
	}


	@Override
	public void onMapReady(GoogleMap mapa) {
		this.mapa = mapa;
		if (mapa== null)
		{
			Toast.makeText(PGMapActivity.this,"Google Maps not Available",
					Toast.LENGTH_LONG).show();
			return;
		}
        checkLocationPermissions();
		mapa.setOnMarkerClickListener(this);
		mapa.setOnCameraChangeListener(this);

		cb_fire = (CheckBox) findViewById(R.id.cb_fire);
		cb_police = (CheckBox) findViewById(R.id.cb_police);
		cb_emergency = (CheckBox) findViewById(R.id.cb_emergency);

		double latitude = getIntent().getDoubleExtra("lat", 0);
		double longitude = getIntent().getDoubleExtra("lng", 0);
		if(latitude != 0 && longitude != 0){
            lat = latitude;
            lng = longitude;
            PositionOnMap();
        }
		finishedTask = 0;

		mapa.clear();
		if(markers!=null)
		{
			for(int i=0;i<markers.length;i++)
			{
				String title = markers[i].type_of_event;
				String snippet = markers[i].user_phone+"&"
						+markers[i].address+"&"
						+markers[i].event_time+"&"
						+markers[i].anonymous+"&"
						+markers[i].location_acc+"&"
						+markers[i].description+"&"+markers[i].id;

				if(markers[i].type_of_event.equals("F"))
				{
					com.google.android.gms.maps.model.Marker m = mapa
							.addMarker(new MarkerOptions()
									.position(new LatLng(markers[i].lat,markers[i].lng))
									.title(title)
									.snippet(snippet)
									.icon(BitmapDescriptorFactory.fromResource(R.drawable.flame_pin)));
					m.hideInfoWindow();
				}
				else
				if(markers[i].type_of_event.equals("E"))
				{
					com.google.android.gms.maps.model.Marker m = mapa
							.addMarker(new MarkerOptions()
									.position(new LatLng(markers[i].lat,markers[i].lng))
									.title(title)
									.snippet(snippet)
									.icon(BitmapDescriptorFactory.fromResource(R.drawable.emergency_pin)));
					m.hideInfoWindow();
				}
				else
				{
					com.google.android.gms.maps.model.Marker m = mapa
							.addMarker(new MarkerOptions()
									.position(new LatLng(markers[i].lat,markers[i].lng))
									.title(title)
									.snippet(snippet)
									.icon(BitmapDescriptorFactory.fromResource(R.drawable.police_pin)));
					m.hideInfoWindow();
				}

			}
		}

	}



    @Override
    public void onLocationChanged(Location location) {
        lat = location.getLatitude();
        lng = location.getLongitude();
        PositionOnMap();
    }

    @Override
    public void onStatusChanged(String s, int i, Bundle bundle) {

    }

    @Override
    public void onProviderEnabled(String s) {

    }

    @Override
    public void onProviderDisabled(String s) {
        //checkLocationPermissions();
    }

    class GetMarkersByCategory extends AsyncTask<Void, Void, Integer>
	{

		@Override
		protected Integer doInBackground(Void... paramss) {
			// TODO Auto-generated method stub
            if (asyncTaskInProgress) return 0;
            asyncTaskInProgress = true ;
            String URL = "http://nemanjastolic.co.nf/guardian/get_all_events.php";
			refresh = 0;

			List<AbstractMap.SimpleEntry> params = new ArrayList<AbstractMap.SimpleEntry>();
			
			params.add(new AbstractMap.SimpleEntry("category_fire", cb_fire.isChecked() ? "1" : "0"));
	        params.add(new AbstractMap.SimpleEntry("category_police", cb_police.isChecked() ? "1" : "0"));
	        params.add(new AbstractMap.SimpleEntry("category_emergency", cb_emergency.isChecked() ? "1" : "0"));


            params.add(new AbstractMap.SimpleEntry("lng_min",Double.toString(lng_min)));
            params.add(new AbstractMap.SimpleEntry("lng_max",Double.toString(lng_max)));
            params.add(new AbstractMap.SimpleEntry("lat_min",Double.toString(lat_min)));
            params.add(new AbstractMap.SimpleEntry("lat_max",Double.toString(lat_max)));
			
        	JSONObject json = JSONParser.makeHttpRequest(URL, "GET", params);
 
            try {
                // Checking for SUCCESS TAG
	                int success = json.getInt(t.TAG_SUCCESS);
	 
	                if (success == 1)
	                {
	                	markers_response = json.getJSONArray(t.TAG_EVENTS);
	                	if(markers_response==null)
	                		Toast.makeText(PGMapActivity.this, "No markers found!", Toast.LENGTH_LONG).show();
	                	else
	                	{
	                		markers = null;
	                		markers = new Marker[markers_response.length()];

                            for (int i = 0; i < markers_response.length(); i++)
                            {
                                JSONObject c = markers_response.getJSONObject(i);

                                markers[i] = new Marker();
                                markers[i].id = c.getString(t.TAG_EVENT_ID);
                                markers[i].setAddress(c.getString(t.TAG_ADDRESS));
                                markers[i].setUser_phone(c.getString(t.TAG_USER_PHONE));
                                markers[i].setType_of_event( c.getString(t.TAG_TYPE_OF_EVENT));
                                markers[i].setDescription(c.getString(t.TAG_DESC));
                                markers[i].setEvent_time(c.getString(t.TAG_EVENT_TIME));
                                markers[i].setLng(c.getDouble(t.TAG_LNG));
                                markers[i].setLat(c.getDouble(t.TAG_LAT));
                                markers[i].setAnonymous(c.getInt(t.TAG_ANONYMOUS));
                                markers[i].setLocation_acc(c.getLong(t.TAG_LOCATION_ACC));
                            }
	                	}
	                }
	                else
	                {
	                	markers = null;
	                }
	               
            	}
            	catch (JSONException e)
            	{
            		
            	}
            
            return 0;
		}
		@Override
		protected void onPostExecute(Integer result)
		{
            DrawMarkers();
            asyncTaskInProgress = false ;
        }
	}


    @Override
    public void onCameraChange(CameraPosition cameraPosition)
    {
        VisibleRegion vr = mapa.getProjection().getVisibleRegion();

        if(Math.abs(lng_max-vr.latLngBounds.northeast.longitude)>0.005 || Math.abs(lat_max-vr.latLngBounds.northeast.latitude)>0.002)
        {
            lat_min = vr.latLngBounds.southwest.latitude;
            lng_min = vr.latLngBounds.southwest.longitude;
            lat_max = vr.latLngBounds.northeast.latitude;
            lng_max = vr.latLngBounds.northeast.longitude;

            new GetMarkersByCategory().execute();
        }
    }
    private boolean isLocationEnabled(){
        return Permissions.Check_FINE_LOCATION(this);
    }
    private void requestLocationPermissions(){
        Permissions.Request_FINE_LOCATION(this,22);
    }
    
    private void checkLocationPermissions() {
        if(!isLocationEnabled())
            requestLocationPermissions();
    }










}
