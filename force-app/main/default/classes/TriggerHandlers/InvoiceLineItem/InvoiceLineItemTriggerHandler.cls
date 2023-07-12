public without sharing class InvoiceLineItemTriggerHandler implements ITriggerHandler {
    private boolean triggerIsExecuting;
    private integer triggerSize;
    public InvoiceLineItemTriggerHelper helper;
    public InvoiceLineItemTriggerHandler(boolean triggerIsExecuting, integer triggerSize) {
        this.triggerIsExecuting = triggerIsExecuting;
        this.triggerSize = triggerSize;
        this.helper = new InvoiceLineItemTriggerHelper();
    }

    public void beforeInsert(List<Invoice_Line_Item__c> newInvoices) {}
    public void beforeUpdate(List<Invoice_Line_Item__c> oldInvoices, List<Invoice__c> newInvoices, Map<ID, SObject> oldInvoiceMap, Map<ID, SObject> newInvoiceMap) {}
    public void beforeDelete(List<Invoice_Line_Item__c> oldInvoices, Map<ID, SObject> oldInvoiceMap) {}

    public void afterInsert(List<Invoice_Line_Item__c> newInvoices, Map<ID, SObject> newInvoiceMap) {

        new InvoiceLineItemTriggerHelper().updateInvoicesWithAmountOfLineItems(newInvoices, new List<Invoice_Line_Item__c>());

    }

    public void afterUpdate(List<Invoice_Line_Item__c> oldInvoices, List<Invoice_Line_Item__c> newInvoices, Map<ID, SObject> oldInvoiceMap, Map<ID, SObject> newInvoiceMap) {
               
        new InvoiceLineItemTriggerHelper().updateInvoicesWithAmountOfLineItems(oldInvoices, newInvoices);

    }

    public void afterDelete(List<Invoice_Line_Item__c> oldInvoices, Map<ID, SObject> oldInvoiceMap) {
        
        new InvoiceLineItemTriggerHelper().updateInvoicesWithAmountOfLineItems(oldInvoices, new List<Invoice_Line_Item__c>());

    }

    public void afterUndelete(List<Invoice_Line_Item__c> newInvoices, Map<ID, SObject> newInvoiceMap) {
        
        new InvoiceLineItemTriggerHelper().updateInvoicesWithAmountOfLineItems(newInvoices, new List<Invoice_Line_Item__c>());

    }
}