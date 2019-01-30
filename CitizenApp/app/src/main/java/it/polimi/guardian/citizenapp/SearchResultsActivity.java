package it.polimi.guardian.citizenapp;

import android.app.ListActivity;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

public class SearchResultsActivity extends ListActivity {

    private String displayString = "";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_search_results);
        TicketAvailabilityInfo tickets[] = (TicketAvailabilityInfo[]) getIntent().getSerializableExtra("tickets");

        if (tickets==null) {    //if there's no internet connection on the phone tickets will be null
            tickets = new TicketAvailabilityInfo[0];
        }
        setListAdapter(new SearchResultListAdapter(this, tickets));
    }

    /*
    public void showSearchResults(View v){
        EditText et = (EditText) findViewById( R.id.et_show_search_results);
        et.setText(displayString);
        //Toast.makeText(SearchResultsActivity.this, displayString, Toast.LENGTH_SHORT);
    }*/
}
