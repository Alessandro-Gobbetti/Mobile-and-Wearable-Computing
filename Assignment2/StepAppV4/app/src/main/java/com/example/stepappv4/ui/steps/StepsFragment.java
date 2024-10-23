package com.example.stepappv4.ui.steps;

import android.content.ContentValues;
import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;
import androidx.lifecycle.ViewModelProvider;

import com.example.stepappv4.R;
import com.example.stepappv4.StepCounterListener;
import com.example.stepappv4.databinding.FragmentStepsBinding;
import com.google.android.material.button.MaterialButtonToggleGroup;
import com.google.android.material.progressindicator.CircularProgressIndicator;
import com.example.stepappv4.StepAppOpenHelper;
import java.text.SimpleDateFormat;
import java.util.TimeZone;

public class StepsFragment extends Fragment {

    private FragmentStepsBinding binding;
    private MaterialButtonToggleGroup materialButtonToggleGroup;
    private TextView stepsTextView;
    private int stepsCounter = 0;
    // TODO 1: Create an object from Sensor class
    private Sensor accSensor;
    // TODO 2: Create an object from SensorManager class
    private SensorManager sensorManager;

    private StepCounterListener sensorListener;

    public View onCreateView(@NonNull LayoutInflater inflater,
                             ViewGroup container, Bundle savedInstanceState) {
        StepsViewModel homeViewModel =
                new ViewModelProvider(this).get(StepsViewModel.class);

        binding = FragmentStepsBinding.inflate(inflater, container, false);
        View root = binding.getRoot();

        // Load the steps counter from the database
        //Timestamp
        long timeInMillis = System.currentTimeMillis();
        // Convert the timestamp to date
        SimpleDateFormat jdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SSS");
        jdf.setTimeZone(TimeZone.getTimeZone("GMT+2"));
        final String dateTimestamp = jdf.format(timeInMillis);
        String currentDay = dateTimestamp.substring(0,10);
        stepsCounter = StepAppOpenHelper.loadSingleRecord(getContext(), currentDay);

        // Set the progress bar
        CircularProgressIndicator progressBar = (CircularProgressIndicator)  root.findViewById(R.id.progressBar);
        progressBar.setMax(100);
        progressBar.setProgress(stepsCounter);

        // Set the steps counter
        stepsTextView = (TextView) root.findViewById(R.id.stepsCount_textview);
        stepsTextView.setText(""+stepsCounter);

        // TODO 3: Get an instance of sensor manager
        sensorManager = (SensorManager) getActivity().getSystemService(Context.SENSOR_SERVICE);
        // TODO 4: Assign ACC. sensor
        accSensor = sensorManager.getDefaultSensor(Sensor.TYPE_LINEAR_ACCELERATION);


        // Toggle group button
        materialButtonToggleGroup = (MaterialButtonToggleGroup) root.findViewById(R.id.toggleButtonGroup);
        materialButtonToggleGroup.addOnButtonCheckedListener(new MaterialButtonToggleGroup.OnButtonCheckedListener() {
            @Override
            public void onButtonChecked(MaterialButtonToggleGroup group, int checkedId, boolean isChecked) {

                if (checkedId == R.id.toggleStart_btn) {

                    // TODO 6: Check if ACC. sensor exists and register the sensor event listener to it when use press start button
                    if (accSensor != null)
                    {
                        //TODO 20 (Your Turn): Pass the progress to the constructor of the listener class

                        sensorListener = new StepCounterListener(getContext(), stepsTextView, progressBar);

                        sensorManager.registerListener(sensorListener, accSensor, SensorManager.SENSOR_DELAY_NORMAL);
                        Toast.makeText(getContext(), R.string.start_text, Toast.LENGTH_LONG).show();
                    }
                    else
                    {
                        Toast.makeText(getContext(), R.string.acc_sensor_not_available, Toast.LENGTH_LONG).show();
                    }



                }
                else if (checkedId == R.id.toggleStop_btn) {
                    // TODO 7: Unregister the sensor event listener when user press stop button
                    sensorManager.unregisterListener(sensorListener);
                    Toast.makeText(getContext(), R.string.stop_text, Toast.LENGTH_LONG).show();
                }
            }
        });

        return root;
    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
        binding = null;
    }
}