package com.example.hell;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import Classes.Users;

public class SignIn extends AppCompatActivity {
    EditText LoginText;
    EditText PasswordText;
    Button  SignIpBtn;
    TextView CreateAccTv;
    Users currentUser = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sign_in);
        for (int i = 1; i < 15; i++){
            Users user = new Users("user" + Integer.toString(i) + "@mail.ru", "password" +  Integer.toString(i));
            Users.UsersList.add(user);
        }


        SignIpBtn = findViewById(R.id.SignIpBtn);
        SignIpBtn.setOnClickListener(this::onClick);
        CreateAccTv = findViewById(R.id.CreateAccTv);
        CreateAccTv.setOnClickListener(this::onClick);

        LoginText = findViewById(R.id.editTextTextPersonName5);
        PasswordText = findViewById(R.id.editTextTextPersonName6);
    }
    public  void  onClick(View view ){
        Intent i;
        switch (view.getId()){
            case R.id.SignIpBtn:

                for (int counter = 0; counter < Users.UsersList.size(); counter++)
                {
                    String aa = LoginText.getText().toString();
                    String bb = Users.UsersList.get(counter).Email.toString();

                    if(aa.equals(bb))
                    {
                        currentUser = Users.UsersList.get(counter);
                        break;
                    }
                }

                if (currentUser != null){
                    if(currentUser.Email.equals(LoginText.getText().toString())
                            && currentUser.Password.equals(PasswordText.getText().toString()))
                    {
                        i = new Intent(this, MainActivity.class);
                        startActivity(i);
                        Toast.makeText(getApplicationContext(),
                                "Успешная авторизация", Toast.LENGTH_SHORT).show();
                    } else if (!currentUser.Email.equals(LoginText.getText().toString())
                            && currentUser.Password.equals(PasswordText.getText().toString())){
                        Toast.makeText(getApplicationContext(),
                                "Неверный логин", Toast.LENGTH_SHORT).show();
                    }else if (currentUser.Email.equals(LoginText.getText().toString())
                            && !currentUser.Password.equals(PasswordText.getText().toString())){
                        Toast.makeText(getApplicationContext(),
                                "Неверный пароль", Toast.LENGTH_SHORT).show();
                    }
                } else {
                    Toast.makeText(getApplicationContext(),
                            "Такого пользователя не существует", Toast.LENGTH_SHORT).show();
                }


                break;
            case R.id.CreateAccTv:
                i = new Intent(this, SignUp.class);
                startActivity(i);
                break;
        }

    }
}