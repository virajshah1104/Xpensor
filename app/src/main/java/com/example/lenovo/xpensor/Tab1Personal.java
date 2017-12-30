package com.example.lenovo.xpensor;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;


public class Tab1Personal extends Fragment {

    SessionManager session;
    private View mmView;
    private ListView lv;
    private final String cancel_req_tag = "go back";
    private final String URL_FOR_LOGIN = "http://192.168.0.131/al/get_personal.php";
    private int uid=9;
    ArrayAdapter<String> adapter;
    ArrayList<String> values = new ArrayList<String>();



    @Override

    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        mmView = inflater.inflate(R.layout.tab1personal, container, false);
        session = new SessionManager(getContext());
        getList();

        lv = (ListView) mmView.findViewById(R.id.list);
        adapter = new ArrayAdapter<String>(getActivity(), android.R.layout.activity_list_item, values);
        lv.setAdapter(adapter);
        adapter.notifyDataSetChanged();
        Button b = (Button) mmView.findViewById(R.id.btn_Logout);
        b.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                session.logoutUser();
            }
        });
        return mmView;

    }
 public void getList(){
        StringRequest strReq = new StringRequest(Request.Method.POST,
                URL_FOR_LOGIN, new Response.Listener<String>()
                {
            @Override
            public void onResponse(String response) {
                try {
                    JSONObject jObj = new JSONObject(response);
                    Boolean error = jObj.getBoolean("error");
                    int i = jObj.getInt("length");
                    if (!error) {
                        for (int j = 0; j < i; j++) {
                            values.add(jObj.getJSONArray("user").getString(j));
                            //Toast.makeText(getContext(),values.get(j),Toast.LENGTH_SHORT).show();
                        }
                    } else {
                        String msg = jObj.getString("error_msg");
                        Toast.makeText(getContext(), msg, Toast.LENGTH_LONG).show();
                    }
                } catch (JSONException e) {
                    Toast.makeText(getContext(), e.toString(), Toast.LENGTH_LONG).show();
                    e.printStackTrace();
                }


            }
        }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(getContext(),
                        error.getMessage(), Toast.LENGTH_LONG).show();
            }
        }) {

            @Override
            protected Map<String, String> getParams() {
                // Posting params to login url
                Map<String, String> params = new HashMap<String, String>();
                params.put("uid", Integer.toString(uid));
                return params;
            }
        };

        // Adding request to request queue
        AppSingleton.getInstance(getContext()).addToRequestQueue(strReq, cancel_req_tag);
    }

}


