public class ReferrallookupWrapper implements Comparable {
    public String ReferralNumber;
    public Date EffectiveDate;
    
  
    
    Public List<ReferrallookupWrapper> reflist = new List<ReferrallookupWrapper>();
    Public List<ReferrallookupWrapper> reflistnew = new List<ReferrallookupWrapper>();
    Public List<ReferrallookupWrapper> reflistnew1 = new List<ReferrallookupWrapper>();
    
    public void assigVal(){
        
        ReferrallookupWrapper refobj3 = new ReferrallookupWrapper();
        refobj3.ReferralNumber = '3';
        refobj3.EffectiveDate = Date.valueOf('1991-01-01');
    reflist.add(refobj3);
        
    ReferrallookupWrapper refobj = new ReferrallookupWrapper();
        refobj.ReferralNumber = '2';
        refobj.EffectiveDate = Date.valueOf('1990-01-01');
    reflist.add(refobj);
    
    ReferrallookupWrapper refobj1 = new ReferrallookupWrapper();
        refobj1.ReferralNumber = '1';
        refobj1.EffectiveDate = Date.valueOf('1980-01-01');
    reflist.add(refobj1);
    
    ReferrallookupWrapper refobj2 = new ReferrallookupWrapper();
        refobj2.ReferralNumber = '3';
        //refobj2.EffectiveDate = Date.valueOf('1980-01-01');

    reflist.add(refobj2);
        system.debug('Before Sort '+ reflist);
    reflist.sort();
        system.debug('After Sort ' + reflist);
        
       if (reflist.size() < 1){
           for (Integer i = 0; i<reflist.size(); i++){
               reflistnew.add(reflist[i]);
          }
          system.debug('reflistnew ' + reflistnew); 
        }
        else{
            reflistnew1 = reflist;
            system.debug('reflistnew1 ' + reflistnew1);
        }
    }
    
    public Integer compareTo (Object compareTo){
        ReferrallookupWrapper comparereferral = (ReferrallookupWrapper)compareTo;
		Integer returnValue;
        if(EffectiveDate != null){
        if (EffectiveDate == comparereferral.EffectiveDate) {
			returnValue = 0;
		}
        if (EffectiveDate > comparereferral.EffectiveDate) {
			 returnValue = -1;
		}if (EffectiveDate < comparereferral.EffectiveDate) {
			 returnValue = 1;
        }
		}
        return returnValue;
    }    
    
}