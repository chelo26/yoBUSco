package it.polimi.guardian.citizenapp;

/**
 * Created by Nemanja on 16/12/2014.
 */

        import java.io.BufferedOutputStream;
        import java.io.BufferedReader;
        import java.io.File;
        import java.io.FileNotFoundException;
        import java.io.FileOutputStream;
        import java.io.FileReader;
        import java.io.IOException;
        import java.io.OutputStream;
        import java.io.OutputStreamWriter;

        import android.app.Activity;
        import android.content.Context;
        import android.util.Log;
        import android.widget.Toast;

public class FileHelper extends Activity{

    private Context context;

    public FileHelper( Context context){
        this.context = context;
    }


    public void writeToFile(String jsonString, String filename) {

        OutputStream outputStream = null;

        try {
            File dir = getAppDirectory();
            File file = new File(dir, filename);
            String filepath = file.getAbsolutePath();
            FileOutputStream fileOutputStream = new FileOutputStream(file);
            outputStream = new BufferedOutputStream(fileOutputStream);
            OutputStreamWriter outputStreamWriter = new OutputStreamWriter(outputStream);
            outputStreamWriter.write(jsonString);
            outputStreamWriter.close();

            Log.d("FileHelper", "File write successful.");
            Log.d("FileHelper", "File path:"+filepath);
            Log.d("FileHelper", "File content:"+jsonString);

        }catch (FileNotFoundException e1) {
            Toast.makeText(this, "Failed to save file"+filename, Toast.LENGTH_LONG).show();
            Log.d("FileHelper - Error:",e1.getMessage());
            e1.printStackTrace();
        }catch(Exception e){
            Log.d("FileHelper - Error:",e.getMessage());
            Toast.makeText(this, "Failed to save file"+filename, Toast.LENGTH_LONG).show();
            e.printStackTrace();
        }
        finally {
            if (outputStream != null) {
                try {
                    outputStream.close();
                } catch (IOException e) {
                    Log.d("FileHelper - Error:",e.getMessage());
                    e.printStackTrace();
                }
            }
        }
    }


    public String readFromFile(String filename) {
        String ret = "";

        try {
            File dir = getAppDirectory();
            File file = new File(dir, filename);
            BufferedReader bufferedReader = new BufferedReader(new FileReader(file));
            String receiveString = "";
            StringBuilder stringBuilder = new StringBuilder();

            while ( (receiveString = bufferedReader.readLine()) != null ) {//kupi se linija
                stringBuilder.append(receiveString);//i doda se u stringBuilder
            }

            ret = stringBuilder.toString();//kada se sve procita, smesti se u ret
            bufferedReader.close();
        }
        catch (FileNotFoundException e) {
            Log.e("FileHelper - Error: ", "File not found: " + e.toString());//create file
            //writeToFile("{}", filename);
        } catch (IOException e) {
            Log.e("FileHelper - Error: ", "Can not read file: " + e.toString());
        }

        return ret;
    }
    public  File getAppDirectory() {
        File defaultAppDirectory = context.getFilesDir();
        String defaultAppDirectoryPath = defaultAppDirectory.getPath();
        Log.d("App directory", defaultAppDirectoryPath);
        return defaultAppDirectory;
    }
    public String getAbsolutePath(String filename){

        File dir = getAppDirectory();
        File file = new File(dir, filename);
        String filepath = file.getAbsolutePath();
        return filepath;
    }
}
