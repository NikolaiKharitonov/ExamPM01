package Classes;

public class Reg {
    public String firstpas = "pas1";
    public String secondpath = "pas1";
    public boolean Registration(String pas1, String pas2)
    {
        if (firstpas.equals(secondpath))
            return true;
        else
            return  false;

    }
    public Reg(String pas1, String pas2){
        firstpas = pas1;
        secondpath = pas2;

    }
}
