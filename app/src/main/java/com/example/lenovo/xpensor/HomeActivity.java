package com.example.lenovo.xpensor;

import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.TabLayout;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.view.ViewPager;
import android.support.v7.app.ActionBar;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class HomeActivity extends AppCompatActivity
{
    private static final String URL_FOR_TRANSACTION = "http://192.168.0.131/al/create_personal_transaction.php";
    private EditText mName,mDesc,mAmt,mWith;
    private String status_cd,status_sn;
    Spinner status1;
    private int uid;
    SessionManager session;



    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);

        session = new SessionManager(getApplicationContext());
        //getList();
        SectionsPagerAdapter mSectionsPagerAdapter;
        ViewPager mViewPager;
        ActionBar toolbar1;
        Intent intent = getIntent();
        //Toast.makeText(getApplicationCo/ntext(), "User Login Status: " + session.isLoggedIn(), Toast.LENGTH_LONG).show();
        session.checkLogin();
        toolbar1 = getSupportActionBar();
        toolbar1.setElevation(0);

        mSectionsPagerAdapter = new SectionsPagerAdapter(getSupportFragmentManager());
        // Set up the ViewPager with the sections adapter.
        mViewPager = (ViewPager) findViewById(R.id.container);
        mViewPager.setAdapter(mSectionsPagerAdapter);
        TabLayout tabLayout = (TabLayout) findViewById(R.id.tabs);
        tabLayout.setupWithViewPager(mViewPager);
        if((intent.hasExtra("username"))&&(intent.hasExtra("userid"))) {
            Bundle bundle=intent.getExtras();
            uid = bundle.getInt("userid");
            //Toast.makeText(getApplicationContext(), "Welcome " + uid, Toast.LENGTH_LONG).show();
        }

        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                AlertDialog.Builder mBuilder = new AlertDialog.Builder(HomeActivity.this);
                View mView = getLayoutInflater().inflate(R.layout.dialog_personal,null);
                mName = (EditText) mView.findViewById(R.id.tranName);
                mDesc = (EditText) mView.findViewById(R.id.tranDesc);
                mWith = (EditText) mView.findViewById(R.id.tranWith);
                mAmt = (EditText) mView.findViewById(R.id.tranAmt);
                status1 = (Spinner) mView.findViewById(R.id.spin_status);
                final ArrayAdapter<String> adap = new ArrayAdapter<String>(HomeActivity.this,
                        android.R.layout.simple_list_item_1,getResources().getStringArray(R.array.status_1));
                adap.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                status1.setAdapter(adap);
                status_sn = "Not Settled";
                mBuilder.setView(mView);
                final AlertDialog dialog = mBuilder.create();
                dialog.show();
                Button mSave = (Button) mView.findViewById(R.id.btnSave);
                mSave.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View view) {
                        status_cd = status1.getSelectedItem().toString();
                        submitForm(
                                Integer.toString(uid),
                                mName.getText().toString(),
                                mDesc.getText().toString(),
                                mWith.getText().toString(),
                                mAmt.getText().toString(),
                                status_cd,status_sn);
                        dialog.dismiss();
                    }
                });
            }
        });
    }


    private void submitForm(final String user, final String name, final String description, final String with_whom,
                            final String amount, final String status_cd, final
                            String status_sn) {
        // Tag used to cancel the request
        String cancel_req_tag = "transaction";
        StringRequest strReq = new StringRequest(Request.Method.POST,
                URL_FOR_TRANSACTION, new Response.Listener<String>() {

            @Override
            public void onResponse(String response) {
                    try {
                        JSONObject jObj = new JSONObject(response);
                        boolean error = jObj.getBoolean("error");

                        if (!error) {
                            String trans = jObj.getJSONObject("personal").getString("transaction_name");
                            Toast.makeText(getApplicationContext(), "Your transaction " + trans + " was successfully Added!", Toast.LENGTH_LONG).show();
                        } else {

                            String errorMsg = jObj.getString("error_msg");
                            Toast.makeText(getApplicationContext(),
                                    errorMsg, Toast.LENGTH_LONG).show();
                        }
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                }
        }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(getApplicationContext(),
                        error.toString(), Toast.LENGTH_LONG).show();
            }
        }) {
            @Override
            protected Map<String,String> getParams() {
                // Posting params to register url
                Map<String,String> params = new HashMap<String,String>();
                params.put("uid",user);
                params.put("name",name);
                params.put("amount", amount);
                params.put("description", description);
                params.put("with_whom", with_whom);
                params.put("status_cd", status_cd);
                params.put("status_sn", status_sn);
                return params;
            }
        };
        AppSingleton.getInstance(getApplicationContext()).addToRequestQueue(strReq, cancel_req_tag);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu)
    {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item)
    {
        int id = item.getItemId();
        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

    public class SectionsPagerAdapter extends FragmentPagerAdapter {

        private SectionsPagerAdapter(FragmentManager fm) {
            super(fm);
        }

        @Override
        public Fragment getItem(int position) {
            //Returning current tabs
            switch(position)
            {
                case 0:
                    Tab1Personal tab1 = new Tab1Personal();
                    return tab1;
                case 1:
                    Tab2Group tab2 = new Tab2Group();
                    return tab2;
                default:
                    return null;
            }
        }

        @Override
        public int getCount() {
            // Show 2 total pages.
            return 2;
        }

        @Override
        public CharSequence getPageTitle(int position) {
            switch (position) {
                case 0:
                    return "PERSONAL";
                case 1:
                    return "GROUP";

            }
            return null;
        }
    }

}
