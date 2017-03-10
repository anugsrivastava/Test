@RestResource(urlMapping='/Merchandise/*')
global class Merchandise {

    // Get merchandise data
    
   @httpget
    global static Merchandise__C getMerchandise(){
        
        RestRequest req = RestContext.request;
        String Merchname = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        merchandise__C result = [select name, description__c, price__c from merchandise__c where name =: Merchname];
        return result;
        //system.debug('result set: ' + result);
    }
    
    @httppost
    global static String createMerchandise(){
        
        //CreateMerchandise capturereq = new CreateMerchandise();
        RestRequest req = RestContext.request;
        System.debug('Request: '+ req);
        System.debug('Request body' + req.requestBody);
        String ABC = req.requestBody.tostring();
        System.debug('Body...' + ABC);
        createMerchandise capturereq = (createMerchandise)JSON.deserialize(req.requestBody.tostring(), CreateMerchandise.Class);
        //Map<String, Object> m = (Map<String, Object>)JSON.deserializeUntyped(ABC);
        //System.debug('MAP...' + m);
        //return capturereq;
        //return String.valueof(m.get('description'));
        
        List<Account> lstacc = new List<Account>();
        lstacc = [select Id, name, description from account where name =: capturereq.Account];
        System.debug('Account details: ' + lstacc);
        
        List<merchandise__C> merchlist = new List<merchandise__C>();
        
        For (Account accobj: lstacc){
           	merchandise__C merch = new merchandise__C();
        merch.name = capturereq.name;
        merch.Description__c = capturereq.description;
        merch.Quantity__c = Decimal.valueof(capturereq.Quantity);
        merch.Price__c = Decimal.valueof(capturereq.price);
        merch.Account__c = accobj.Id;
            merchlist.add(merch);
        }
        System.debug('merchandise object ..' + merchlist);
        //insert merchlist;
        
        //return merch.Id;
        
        httpresponse res = new httpresponse();
        res = AuthCallOut();
        return 'Inserted';
    }
    
    global Class CreateMerchandise{
        String Name{get;set;}
        String Description{get;set;}
        String Price{get;set;}
        String Quantity{get;set;}
        String Account{get;set;}
    }

    public static httpresponse AuthCallOut(){
        String url = 'https://ap2.salesforce.com/services/oauth2/token?format=application/json&client_id=3MVG9ZL0ppGP5UrCyVSJ.V7nRFUW72aNmqlaLqbwIWXafE4EppizuYApgq8XnqOTozWyEn2Lc0qdvF.hUrpHp&client_secret=3075989588270243545&grant_type=password&username=anugrah@anugrah.com&password=qwerty123mZC3VDxhaOtThL5eY0riYdYYO';
        Http http = new http();
        HttpRequest req = new HttpRequest();
        req.setendpoint(url);
        req.setmethod('POST');
        Httpresponse res = http.send(req);
        System.debug('Http Response: ' + res);
        System.debug('Http Response Body: ' + res.getBody());
        //Map<String, Object> serialres = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
        //String Token = serialres.get('access_token');
        //system.debug('Token: '+ Token);
        return(res);
    }
}