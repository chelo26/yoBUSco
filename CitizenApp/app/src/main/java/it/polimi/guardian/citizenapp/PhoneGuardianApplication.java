package it.polimi.guardian.citizenapp;

import android.app.Application;
import android.content.Context;

/**
 * Created by ntasic on 5/8/14.
 */



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