package Classes;

public  class Auth {
    public String LoginAuth = "Zarry";
    public String PasswordAuth = "pswrdZarry";
    public boolean Authorization(String login, String password)
    {
        if (login.equals(LoginAuth) && password.equals(PasswordAuth))
            return true;
        else
            return  false;

    }
    public Auth(String login1, String password1){
        LoginAuth = login1;
        PasswordAuth = password1;

    }
}
