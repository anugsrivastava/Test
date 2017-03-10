global with sharing class InvoiceUtilities {

    // Class method to renumber Line Items for a given Invoice number.
    // Returns a string that indicates success or failure.
    
    webservice static string renumberlineitems(String Invoicename){
        
        // Create a copy of the target Invoice object and its Line Items.
        
        Invoice__c invoice = [select i.name, (select name from line_items__r order by name)
                             from invoice__c i
                             where i.name =: Invoicename LIMIT 1];
        
        // Loop through each Line Item, re-numbering as you go
        integer i = 1;
        for (Line_item__c item : invoice.line_items__r){
            item.name = String.valueOf(i);
            System.debug(item.name);
            i++;
        }
        
        // Update the Line Items in one transaction, rollback if any problems
        // and return error messages to the calling environment.
        try{
            Database.update(invoice.line_items__r);
        }
        catch(Dmlexception e){
            return e.getMessage();
        }     
        // On success, return a message to the calling program.
        return 'Line items numbered';
        
    }
    
}