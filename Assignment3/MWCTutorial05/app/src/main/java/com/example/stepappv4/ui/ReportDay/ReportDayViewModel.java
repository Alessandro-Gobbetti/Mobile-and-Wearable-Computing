package com.example.stepappv4.ui.ReportDay;

import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.ViewModel;

public class ReportDayViewModel extends ViewModel {

    private final MutableLiveData<String> mText;

    public ReportDayViewModel() {
        mText = new MutableLiveData<>();
        mText.setValue("This is day fragment");
    }

    public LiveData<String> getText() {
        return mText;
    }
}