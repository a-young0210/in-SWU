package com.ayoung.applicationlayout;

import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.ImageView;

public class MainActivity extends AppCompatActivity {
    boolean check1, check2;
    boolean image = true;

   @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //액션바 숨기기
        ActionBar actionBar = getSupportActionBar();
        actionBar.hide();

        //수박 체크박스 상태 받아오기
        CheckBox checkBox = (CheckBox) findViewById(R.id.checkbox) ;
        checkBox.setOnClickListener(new CheckBox.OnClickListener() {
           @Override
           public void onClick(View v) {
               if (checkBox.isChecked()) {
                   check1 = true;
               } else {
                   check1 = false;
               }
           }
        }) ;

        //복숭아 체크박스 상태 받아오기
        CheckBox checkBox2 = (CheckBox) findViewById(R.id.checkbox2) ;
        checkBox2.setOnClickListener(new CheckBox.OnClickListener() {
           @Override
           public void onClick(View v) {
               if (checkBox2.isChecked()) {
                   check2 = true;
               } else {
                   check2 = false;
               }
           }
        }) ;

        //버튼1 클릭 시 수박 체크박스 상태 변환
        Button button1 = (Button) findViewById(R.id.button);
        button1.setOnClickListener(new Button.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (check1 == true) {
                    checkBox.setChecked(false);
                    check1 = false;
                }
                else {
                    checkBox.setChecked(true);
                    check1 = true;
                }
            }
        });

        //버튼2 클릭 시 복숭아 체크박스 상태 변환
       Button button2 = (Button) findViewById(R.id.button2);
       button2.setOnClickListener(new Button.OnClickListener() {
           @Override
           public void onClick(View v) {
               if (check2 == true) {
                   checkBox2.setChecked(false);
                   check2 = false;
               }
               else {
                   checkBox2.setChecked(true);
                   check2 = true;
               }
           }
       });

       //긴 버튼 클릭 시 이미지 뷰 이미지 소스 변환
       ImageView imageView = (ImageView) findViewById(R.id.imageView) ;
       Button button3 = (Button) findViewById(R.id.button3);
       button3.setOnClickListener(new Button.OnClickListener() {
           @Override
           public void onClick(View v) {
               if (image == true) {
                   imageView.setImageResource(R.drawable.cat);
                   image = false;
               }
               else {
                   imageView.setImageResource(R.drawable.dog);
                   image = true;
               }
           }
       });
    }


}