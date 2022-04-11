package com.ayoung.calculator;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity {

    String num1,num2;
    Integer result;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        setTitle("Calculator");

        Button plusBtn = (Button)findViewById(R.id.plusBtn);
        Button minusBtn = (Button)findViewById(R.id.minusBtn);
        Button multiBtn = (Button)findViewById(R.id.multiBtn);
        Button divideBtn = (Button)findViewById(R.id.divideBtn);
        EditText edit1 = (EditText)findViewById(R.id.edit1);
        EditText edit2 = (EditText)findViewById(R.id.edit2);
        EditText edit3 = (EditText)findViewById(R.id.edit3);

        //Plus Action
        plusBtn.setOnClickListener(view -> {
            num1 = edit1.getText().toString();
            num2 = edit2.getText().toString();
            result = Integer.parseInt(num1) + Integer.parseInt(num2);
            edit3.setText(result.toString());

        });
        //Minus Action
        minusBtn.setOnClickListener(view -> {
            num1 = edit1.getText().toString();
            num2 = edit2.getText().toString();
            result = Integer.parseInt(num1) - Integer.parseInt(num2);
            edit3.setText(result.toString());

        });

        //Multi Action
        multiBtn.setOnClickListener(view -> {
            num1 = edit1.getText().toString();
            num2 = edit2.getText().toString();
            result = Integer.parseInt(num1) * Integer.parseInt(num2);
            edit3.setText(result.toString());

        });

        //Div Action
        divideBtn.setOnClickListener(view -> {
            num1 = edit1.getText().toString();
            num2 = edit2.getText().toString();
            double result_d = Double.parseDouble(num1) / Double.parseDouble(num2);
            result = (int) Math.round(result_d);
            edit3.setText(result.toString());
        });
    }
}