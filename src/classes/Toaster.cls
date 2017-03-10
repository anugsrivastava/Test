public class Toaster implements KitchenUtility {
    
    private string modelnumber;
    
    public toaster(string themodelname, integer themodelnumber){
        string modelname = themodelname;
        integer modelnumber = themodelnumber;
    }
    public string getmodelnumber(){
        return 'T' + modelnumber;
    }

}