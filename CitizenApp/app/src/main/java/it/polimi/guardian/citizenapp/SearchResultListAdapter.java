package it.polimi.guardian.citizenapp;

import android.app.Activity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

public class SearchResultListAdapter extends ArrayAdapter {

    private final Activity context;
    private final TicketAvailabilityInfo[] tickets;


    public SearchResultListAdapter(Activity context, TicketAvailabilityInfo[] tickets) {
        super(context, R.layout.search_result_list_item, tickets);

        this.context=context;
        this.tickets = tickets;
    }

    public View getView(int position, View view, ViewGroup parent) {

        LayoutInflater inflater = context.getLayoutInflater();
        View rowView = inflater.inflate(R.layout.search_result_list_item, parent,false);

        ImageView iv_icon = (ImageView) rowView.findViewById(R.id.search_result_item_icon);
        TextView tv_company = (TextView) rowView.findViewById(R.id.search_result_item_company);
        TextView tv_time_info = (TextView) rowView.findViewById(R.id.search_result_item_time_info);
        TextView tv_price = (TextView) rowView.findViewById(R.id.search_result_item_price);

        tv_company.setText(tickets[position].getCompany());
        tv_time_info.setText(tickets[position].getDepartureDate()+" "+tickets[position].getDepartureTime()+"--->"+tickets[position].getArrivalDate()+" "+tickets[position].getArrivalTime());
        tv_price.setText(String.valueOf(tickets[position].getPrice())+" "+tickets[position].getCurrency());

        switch (tickets[position].getCompany()) {
            case "La Paz Tours":
                iv_icon.setImageResource(R.drawable.flame_gray);
                break;
            case "P":
                iv_icon.setImageResource(R.drawable.police_badge_gray);
                break;
            default:
                iv_icon.setImageResource(R.drawable.ambulance_gray);
                break;
        }

        return rowView;
    }
}