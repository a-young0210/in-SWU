package com.ayoung.buttontoast;

import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    int num1, num2, resultInt = 0;
    String result;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //액션바 숨기
        ActionBar actionBar = getSupportActionBar();
        actionBar.hide();

        //안녕하세요 버튼 클릭 시 토스트 메시지
        Button button = (Button) findViewById(R.id.button);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(getApplicationContext(), "안녕하세요", Toast.LENGTH_SHORT).show();
            }

        });

        //고맙습니다 버튼 클릭 시 토스트 메시지
        Button button2 = (Button) findViewById(R.id.button2);
        button2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(getApplicationContext(), "고맙습니다", Toast.LENGTH_LONG).show();
            }

        });

        //결과값 버튼 클릭 시 토스트 메시지
        Button button3 = (Button) findViewById(R.id.button3);
        button3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                EditText editText = (EditText) findViewById(R.id.editText);
                num1 = Integer.parseInt(editText.getText().toString());

                EditText editText2 = (EditText) findViewById(R.id.editText2);
                num2 = Integer.parseInt(editText2.getText().toString());

                resultInt = num1 + num2;

                result = String.valueOf(resultInt);

                Toast.makeText(getApplicationContext(), result, Toast.LENGTH_LONG).show();
            }
        });

    }
}