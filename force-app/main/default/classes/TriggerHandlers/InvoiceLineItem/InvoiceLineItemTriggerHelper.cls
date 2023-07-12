public without sharing class InvoiceLineItemTriggerHelper {

    private List<Invoice__c> getInvoicesByIds(Set<Id> invoicesIds) {
        return [SELECT Id, Amount_of_line_items__c, (SELECT Id FROM Invoice_Line_Items__r) FROM Invoice__c WHERE Id IN :invoicesIds];
    }

    private Set<Id> getInvoiceIdsFromLineItemsList(List<Invoice_Line_Item__c> oldLineItems, List<Invoice_Line_Item__c> newLineItems){
        Set<Id> invoiceIds = new Set<Id>();
        for(Invoice_Line_Item__c li : oldLineItems){
            invoiceIds.add(li.Invoice__c);
        }
        for(Invoice_Line_Item__c li : newLineItems){
            invoiceIds.add(li.Invoice__c);
        }
        return invoiceIds;
    }

    public void updateInvoicesWithAmountOfLineItems(List<Invoice_Line_Item__c> oldLineItems, List<Invoice_Line_Item__c> newLineItems){
        List<Invoice__c> invoicesToUpdate = getInvoicesByIds(getInvoiceIdsFromLineItemsList(oldLineItems, newLineItems));

        for(Invoice__c invoice : invoicesToUpdate){
            invoice.Amount_of_line_items__c = invoice.Invoice_Line_Items__r.size();
        }

        update invoicesToUpdate;

    }

}