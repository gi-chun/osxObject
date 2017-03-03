package com.sjp.sjplab.sjplabandroidot;

import android.app.Activity;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageButton;
import android.widget.RadioButton;
import android.widget.RadioGroup;

public class FragmentConfig extends Fragment implements RadioGroup.OnCheckedChangeListener {

    private static final int VIEW_MODE_RGBA = 0;
    private static final int VIEW_MODE_FEATURES = 5;
    private static final int VIEW_MODE_CMT = 8;
    private static final int START_TLD = 6;
    private static final int START_CMT = 7;

    private boolean tracking_ready = false;
    private int current_startViewMode = START_CMT;
    private boolean isVideoActivity = false;
    private boolean isCreateCommand = false;

    public FragmentConfig() {
        // Required empty public constructor
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        View view = inflater.inflate(R.layout.fragment_config, container, false);


        RadioGroup rd = (RadioGroup) view.findViewById(R.id.radioGroup2);
        String currentActivityName =  getActivityName(getActivity());
        if(currentActivityName.equals("VideoActivity")){
            isVideoActivity = true;
            //rd.check(R.id.radioStream);
            ((RadioButton)rd.findViewById(R.id.radioStream)).setChecked(true);
        }else{
            isVideoActivity = false;
            //rd.check(R.id.radioCam);
            ((RadioButton)rd.findViewById(R.id.radioCam)).setChecked(true);
        }

        RadioGroup rd2 = (RadioGroup) view.findViewById(R.id.radioGroup);
        rd2.setOnCheckedChangeListener(this);
        rd2 = (RadioGroup) view.findViewById(R.id.radioGroup2);
        rd2.setOnCheckedChangeListener(this);

        isCreateCommand = true;

        final ImageButton button = (ImageButton) view.findViewById(R.id.imageButton2);
        button.setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View v)
            {
                // do something
                if(tracking_ready){
                    tracking_ready = false;
                    if(isVideoActivity){
                        ((VideoActivity) getActivity()).setTracking_ready(tracking_ready);
                        ((VideoActivity) getActivity()).setmSetViewMode(current_startViewMode);
                    }else{
                        ((MainActivity) getActivity()).setTracking_ready(tracking_ready);
                        ((MainActivity) getActivity()).setmSetViewMode(current_startViewMode);
                    }

                    button.setImageResource(R.drawable.tracking_normal);

                }else{
                    tracking_ready = true;
                    if(isVideoActivity) {
                        ((VideoActivity) getActivity()).setTracking_ready(tracking_ready);
                    }else{
                        ((MainActivity) getActivity()).setTracking_ready(tracking_ready);
                    }

                    button.setImageResource(R.drawable.tracking_pressed);
                }

            }
        });
        return view;
    }

    public void onCheckedChanged(RadioGroup arg0, int arg1) {

//        if(isCreateCommand){
//            isCreateCommand = false;
//            return;
//        }

        switch (arg1) {
            case R.id.radioNormal:
                if(isVideoActivity) {
                    ((VideoActivity) getActivity()).setmSetViewMode(START_CMT);
                }else{
                    ((MainActivity) getActivity()).setmSetViewMode(START_CMT);
                }
                current_startViewMode = START_CMT;
                break;
            case R.id.radioOther:
                if(isVideoActivity) {
                    ((VideoActivity) getActivity()).setmSetViewMode(START_TLD);
                }else{
                    ((MainActivity) getActivity()).setmSetViewMode(START_TLD);
                }
                current_startViewMode = START_TLD;
                break;
            case R.id.radioCam:
                if(isVideoActivity) {
                    ((VideoActivity) getActivity()).changeActivity();
                }else{
                    ((MainActivity) getActivity()).changeActivity();
                }

                break;
            case R.id.radioStream:
                if(isVideoActivity) {
                    ((VideoActivity) getActivity()).changeActivity();
                }else{
                    ((MainActivity) getActivity()).changeActivity();
                }
                break;

        }
    }


    public String getActivityName(Activity activity) {
        String activityName = activity.getLocalClassName();
        int index = activityName.lastIndexOf(".");
        if(index != -1) {
            activityName = activityName.substring(index + 1);
        }
        return activityName;
    }
}