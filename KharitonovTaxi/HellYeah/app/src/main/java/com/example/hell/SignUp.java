package com.example.hell;

import androidx.appcompat.app.AppCompatActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class SignUp extends AppCompatActivity {
    Button SignUpBtn;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sign_up);
        SignUpBtn = findViewById(R.id.SignUpBtn);
        SignUpBtn.setOnClickListener(this::onClick);

    }
    public  void  onClick(View view ){
        switch (view.getId())
        {
            case R.id.SignUpBtn:
                Intent i = new Intent(this, SignIn.class);
                startActivity(i);
            case R.id.GoToAuth:
                Intent a = new Intent(this, SignIn.class);
                startActivity(a);

        }
    }
}