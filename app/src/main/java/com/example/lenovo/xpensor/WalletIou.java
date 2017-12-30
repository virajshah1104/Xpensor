package com.example.lenovo.xpensor;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.ListView;

public class WalletIou extends AppCompatActivity
{

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.wallet_iou);

        // Array of strings...
        String[] mobileArray = {"Personal" + "\nYou owe Aditya Pingale Rs.200" , "Group"+"\nYou owe Saurabh Ughade Rs.300"};

        ArrayAdapter adapter = new ArrayAdapter<String>(WalletIou.this, R.layout.wallet_inside_listview, mobileArray);

        ListView listView = (ListView) findViewById(R.id.mobile_list);
        listView.setAdapter(adapter);

    }
}