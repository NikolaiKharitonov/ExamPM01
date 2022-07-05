package Classes;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

public class Users {
    public String Email;
    public String Password;
    public  static ArrayList<Users> UsersList = new ArrayList<Users>() ;

    public  Users(String email, String password){
        Email = email;
        Password = password;
    }
}
