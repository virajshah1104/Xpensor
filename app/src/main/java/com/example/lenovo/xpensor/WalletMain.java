package com.example.lenovo.xpensor;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.Toast;
import android.widget.Button;

public class WalletMain extends AppCompatActivity
{
    private LinearLayout uome;
    private Button iou, uom;
    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.wallet_main);
        Toast.makeText(getApplicationContext(),"Welcome",Toast.LENGTH_LONG).show();
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        /*uome.setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View view)
            {
                Toast.makeText(getApplicationContext(),"Welcome",Toast.LENGTH_LONG).show();
            }
        });*/

        //I OWE YOU BUTTON//
        iou = (Button) findViewById(R.id.iou);
        iou.setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View view)
            {
                //Toast.makeText(getApplicationContext(),"I OWE YOU",Toast.LENGTH_LONG).show();
                Intent toy1 = new Intent(getApplicationContext(),WalletIou.class);
                startActivity(toy1);
            }
        });

        //YOU OWE ME BUTTON//
        uom = (Button) findViewById(R.id.uom);
        uom.setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View view)
            {
                //Toast.makeText(getApplicationContext(),"YOU OWE ME",Toast.LENGTH_LONG).show();
                Intent toy2 = new Intent(getApplicationContext(),WalletUom.class);
                startActivity(toy2);
            }
        });


    }

    @Override
    public boolean onSupportNavigateUp()
    {
        finish();
        return true;
    }
}
