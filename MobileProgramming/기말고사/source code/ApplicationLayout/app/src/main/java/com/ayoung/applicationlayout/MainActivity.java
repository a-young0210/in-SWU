package com.ayoung.applicationlayout;

import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.StrictMode;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import org.w3c.dom.Text;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.SocketAddress;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

public class MainActivity extends AppCompatActivity {
    Handler handler = new Handler(); // 토스트를 띄우기 위한 메인스레드 핸들러 객체 생성
    String response; //서버 응답

    //날짜 형식 지정
    String format_HHmmss = "hh:mm:ss";
    SimpleDateFormat format = new SimpleDateFormat(format_HHmmss, Locale.getDefault());

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        EditText editText = (EditText) findViewById(R.id.editText);
        TextView mermanMsg = (TextView) findViewById(R.id.mermanMsgView);

        //액션바 숨기기
        ActionBar actionBar = getSupportActionBar();
        actionBar.hide();

        int SDK_INT = android.os.Build.VERSION.SDK_INT;

        if (SDK_INT > 8)
        {
            StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder()
                    .permitAll().build();
            StrictMode.setThreadPolicy(policy);
        }

        //전송 버튼 클릭 리스너
        Button button = (Button) findViewById(R.id.button);
        button.setOnClickListener(new Button.OnClickListener() {
            @Override
            public void onClick(View v) {
                //날짜 받아오기
                Date currentTime = Calendar.getInstance().getTime();
                String current = format.format(currentTime);
                String sendMsg = "(" + current + ") " + editText.getText() + "\n";

                mermanMsg.append(sendMsg);

                String addr = "192.168.0.4";
                SocketThread thread = new SocketThread(addr, sendMsg);
                thread.start();

            }
        });

    }

    class SocketThread extends Thread{
        String host; // 서버 IP
        String data; // 전송 데이터

        public SocketThread(String host, String data){
            this.host = host.trim();
            this.data = data;

        }

        @Override
        public void run() {

            try{
                int port = 8888; //포트 번호는 서버측과 똑같이
                InetAddress serverAddr = InetAddress.getByName(host);
                Socket socket =  new Socket(serverAddr, port);

                ObjectOutputStream outstream = new ObjectOutputStream(socket.getOutputStream()); //소켓의 출력 스트림 참조
                outstream.writeObject(data); // 출력 스트림에 데이터 넣기
                outstream.flush(); // 출력
                ObjectInputStream instream = new ObjectInputStream(socket.getInputStream()); // 소켓의 입력 스트림 참조
                BufferedReader input = new BufferedReader(new InputStreamReader(socket.getInputStream()));
                String read = input.readLine();
                response = (String) instream.readObject(); // 응답 가져오기
                /* 토스트로 서버측 응답 결과 띄워줄 러너블 객체 생성하여 메인스레드 핸들러로 전달 */
                handler.post(new Runnable() {
                    TextView serverMsg = (TextView) findViewById(R.id.serverMsgView);
                    @Override
                    public void run() {
                        serverMsg.append(response);
                    }
                });

                socket.close(); // 소켓 해제
            }catch(Exception e){
                e.printStackTrace();
            }
        }
    }
}