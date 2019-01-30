package it.polimi.guardian.citizenapp;

import android.content.Intent;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.support.v4.app.DialogFragment;
import android.widget.Button;
import android.widget.RadioButton;
import android.widget.Spinner;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutionException;

public class SearchActivity extends AppCompatActivity {

    boolean asyncTaskInProgress = false;
    int refresh = 1;
    DialogFragment departureDatePicker = new MyDatePickerFragment();
    DialogFragment returnDatePicker = new MyDatePickerFragment();
    TicketAvailabilityInfo tickets[];


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_search);
    }

    public void showDepartureDatePicker(View v) {
        departureDatePicker.show(this.getSupportFragmentManager(), "departure date picker");
    }

    public void showReturnDatePicker(View v) {
        returnDatePicker.show(this.getSupportFragmentManager(), "return date picker");
    }

    public void updateDepartureDateText() {
        MyDatePickerFragment downcastedPicker = (MyDatePickerFragment)departureDatePicker;
        if((downcastedPicker._dateString!="")) {
            Button btn_depart = (Button) findViewById(R.id.btn_select_departure_date);
            btn_depart.setText(downcastedPicker._dateString);
        }
    }

    public void updateReturnDateText(){
        MyDatePickerFragment downcastedPicker = (MyDatePickerFragment)returnDatePicker;
        if((downcastedPicker._dateString!="")) {
            Button btn_depart = (Button) findViewById(R.id.btn_select_return_date);
            btn_depart.setText(downcastedPicker._dateString);
        }
    }


    public void searchTickets(View v){
        try
        {
            new GetMarkersByCategory().execute().get();//starting of thread
        }
        catch (InterruptedException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        catch (ExecutionException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }


    class GetMarkersByCategory extends AsyncTask<Void, Void, Integer>
    {

        @Override
        protected Integer doInBackground(Void... paramss) {
            // TODO Auto-generated method stub
            if (asyncTaskInProgress) return 0;
            asyncTaskInProgress = true ;
            String URL = "http://nemanjastolic.co.nf/busco/get_tickets_by_date.php";
            refresh = 0;

            List<AbstractMap.SimpleEntry> params = new ArrayList<AbstractMap.SimpleEntry>();

            Spinner sp_from = (Spinner) findViewById(R.id.spinner_bus_search_from);
            Spinner sp_to = (Spinner) findViewById(R.id.spinner_bus_search_to);
            Spinner sp_ticket_number = (Spinner) findViewById(R.id.spinner_ticket_number);

            RadioButton rb_one_way =  (RadioButton) findViewById(R.id.rb_bus_search_one_way);
            RadioButton rb_both_ways =  (RadioButton) findViewById(R.id.rb_bus_search_return);

            String departureDate = ((MyDatePickerFragment)departureDatePicker)._dateString;
            String returnDate = ((MyDatePickerFragment)returnDatePicker)._dateString;
            if(returnDate == null || returnDate=="")
                returnDate = departureDate;

            params.add(new AbstractMap.SimpleEntry("from_city", sp_from.getSelectedItem().toString()));
            params.add(new AbstractMap.SimpleEntry("to_city", sp_to.getSelectedItem().toString()));
            params.add(new AbstractMap.SimpleEntry("departure_date", departureDate));
            params.add(new AbstractMap.SimpleEntry("return_date", returnDate));
            params.add(new AbstractMap.SimpleEntry("both_ways", rb_both_ways.isChecked() ? "1" : "0"));
            params.add(new AbstractMap.SimpleEntry("number_of_tickets", sp_ticket_number.getSelectedItem().toString()));

            JSONObject json = JSONParser.makeHttpRequest(URL, "GET", params);

            try {
                int success = json.getInt("success");

                if (success == 1)
                {
                    JSONArray tickets_response = json.getJSONArray("tickets");
                    if(tickets_response==null)
                        Toast.makeText(SearchActivity.this, "No tickets found!", Toast.LENGTH_LONG).show();
                    else
                    {

                        tickets = null;
                        tickets = new TicketAvailabilityInfo[tickets_response.length()];

                        for (int i = 0; i < tickets_response.length(); i++)
                        {
                            JSONObject c = tickets_response.getJSONObject(i);

                            tickets[i] = new TicketAvailabilityInfo();
                            tickets[i].setCompany(c.getString("company"));
                            tickets[i].setDepartureCity(c.getString("from_city"));
                            tickets[i].setDestinationCity(c.getString("to_city"));
                            tickets[i].setDepartureDate( c.getString("departure_date"));
                            tickets[i].setDepartureTime( c.getString("departure_time"));
                            tickets[i].setArrivalDate(c.getString("arrival_date"));
                            tickets[i].setArrivalTime(c.getString("arrival_time"));
                            tickets[i].setPrice(c.getDouble("price"));
                            tickets[i].setCurrency(c.getString("currency"));
                            tickets[i].setTicketsLeft(c.getInt("tickets_left"));
                        }
                    }
                }
                else
                {
                    tickets = null;
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
            Intent i = new Intent(getApplicationContext(),SearchResultsActivity.class );
            i.putExtra("tickets", tickets);
            startActivity(i);
            asyncTaskInProgress = false;
        }
    }
}
