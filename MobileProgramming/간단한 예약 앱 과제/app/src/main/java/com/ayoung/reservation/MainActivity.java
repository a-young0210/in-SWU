package com.ayoung.reservation;

import androidx.appcompat.app.AppCompatActivity;

import android.app.DatePickerDialog;
import android.app.TimePickerDialog;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.TextView;
import android.widget.TimePicker;

import java.util.Calendar;

public class MainActivity extends AppCompatActivity {
    Button btnSelectDate, btnSelectTime;
    TextView resDate, resTime;
    DatePickerDialog datePickerDialog;
    TimePickerDialog timePickerDialog;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        btnSelectDate = (Button)findViewById(R.id.button1);
        btnSelectTime = (Button)findViewById(R.id.button2);
        resDate = (TextView)findViewById(R.id.textView1);
        resTime = (TextView)findViewById(R.id.textView2);
    }

    public void onClick(View v) {
        if (v == btnSelectDate) {
            final Calendar c = Calendar.getInstance();
            int mYear = c.get(Calendar.YEAR);
            int mMonth = c.get(Calendar.MONTH);
            int mDay = c.get(Calendar.DAY_OF_MONTH);

            DatePickerDialog datePickerDialog = new DatePickerDialog(this,
                    new DatePickerDialog.OnDateSetListener() {
                        @Override
                        public void onDateSet(DatePicker view, int year,
                                              int monthOfYear, int dayOfMonth) {
                            resDate.setText(year + "년" + (monthOfYear + 1) + "월" + dayOfMonth + "일");
                        }
                    }, mYear, mMonth, mDay);
                datePickerDialog.show();
        }
        if(v == btnSelectTime) {
            final Calendar c = Calendar.getInstance();
            int mHour = c.get(Calendar.HOUR);
            int mMinute = c.get(Calendar.MINUTE);

            TimePickerDialog timePickerDialog = new TimePickerDialog(this,
                    new TimePickerDialog.OnTimeSetListener() {
                        @Override
                        public void onTimeSet(TimePicker view, int hourOfDay, int minute) {
                            resTime.setText(hourOfDay + "시" + minute + "분");
                        }
                    }, mHour, mMinute, false);
                timePickerDialog.show();
        }
    }
}