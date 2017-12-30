package com.example.lenovo.xpensor;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.ListView;

public class WalletUom extends AppCompatActivity
{

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.wallet_uom);

        // Array of strings...
        String[] mobileArray2 = {"Personal" + "\nYou're owed Rs.200 by Aditya Pingale" , "Group"+"\nYou'red owed Rs.300 by Saurabh Ughade"};

        ArrayAdapter adapter2 = new ArrayAdapter<String>(WalletUom.this, R.layout.wallet_inside_listview, mobileArray2);

        ListView listView = (ListView) findViewById(R.id.mobile_list2);
        listView.setAdapter(adapter2);

    }
}
