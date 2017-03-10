public class Fridge implements KitchenUtility {
	private string modelnumber;
    public integer numberinstock;
    
    public fridge(){
        modelnumber = 'XYZ';
        numberinstock = 100;
    }
    
    public fridge(string themodelnumber, integer thenumberinstock){
        modelnumber = themodelnumber;
        numberinstock = thenumberinstock;
    }
    
    public void setmodelnumber(String themodelnumber){
        modelnumber = themodelnumber;
    }
    
    public string getmodelnumber(){
        return modelnumber;
    }
    
    public void updatestock(Integer justsold){
        numberinstock = numberinstock - justsold;
    }
    
    public static void todebug(fridge somefridge){
        system.debug('Stock number: ' + somefridge.modelnumber);
        system.debug('Stock: ' + somefridge.numberinstock);
    }
    
    public integer ecorating{
        get { return ecorating; }
        set {ecorating = value; if(ecorating<0) ecorating =0;}
    }
}