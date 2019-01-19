package it.polimi.guardian.citizenapp;

import android.content.Context;


public class PhoneGuardianApplication extends android.support.multidex.MultiDexApplication
{
    private static PhoneGuardianApplication instance; //singleton klasa

    public PhoneGuardianApplication()
    {
        instance=this;
    }

    public static Context getContext()
    {
        return instance;
    }

}