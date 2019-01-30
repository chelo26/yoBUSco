package it.polimi.guardian.citizenapp;

import android.app.DatePickerDialog;
import android.app.Dialog;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.widget.DatePicker;
import android.widget.Toast;

import java.util.Calendar;

public class MyDatePickerFragment extends DialogFragment {

    public int _year = 0;
    public int _month = 0;
    public int _day = 0;
    public String _dateString = "";

    @Override
    public Dialog onCreateDialog(Bundle savedInstanceState) {

        final Calendar c = Calendar.getInstance();
        int year = c.get(Calendar.YEAR);
        int month = c.get(Calendar.MONTH);
        int day = c.get(Calendar.DAY_OF_MONTH);

        return new DatePickerDialog(getActivity(), dateSetListener, year, month, day);
    }

    private DatePickerDialog.OnDateSetListener dateSetListener =
            new DatePickerDialog.OnDateSetListener() {
                public void onDateSet(DatePicker view, int year, int month, int day) {
                    _year = year;//view.getYear()
                    _month = month+1;//view.getMonth()+1
                    _day = day;//view.getDayOfMonth()
                    _dateString = String.format("%04d", _year)
                            +"-"+String.format("%02d", _month)
                            +"-"+String.format("%02d", _day);
                    ((SearchActivity)getActivity()).updateDepartureDateText();
                    ((SearchActivity)getActivity()).updateReturnDateText();
                    /*
                    Toast.makeText(getActivity(), "selected date is " + view.getYear() +
                            " / " + (view.getMonth()+1) +
                            " / " + view.getDayOfMonth(), Toast.LENGTH_SHORT).show();*/
                }
            };
}
