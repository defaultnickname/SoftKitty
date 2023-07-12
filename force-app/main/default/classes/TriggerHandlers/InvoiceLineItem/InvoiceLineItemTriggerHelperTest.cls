@IsTest
public class InvoiceLineItemTriggerHelperTest {

    @IsTest
    public static void testUpdateInvoicesWithAmountOfLineItems() {
        // Create test data
        List<Invoice__c> invoices = new List<Invoice__c>{
            new Invoice__c(),
            new Invoice__c(),
            new Invoice__c()
        };
        insert invoices;

        List<Invoice_Line_Item__c> lineItems = new List<Invoice_Line_Item__c>{
            new Invoice_Line_Item__c(Invoice__c = invoices[0].Id),
            new Invoice_Line_Item__c(Invoice__c = invoices[0].Id),
            new Invoice_Line_Item__c(Invoice__c = invoices[1].Id),
            new Invoice_Line_Item__c(Invoice__c = invoices[2].Id)
        };
        insert lineItems;

        // Call the method under test
        InvoiceLineItemTriggerHelper helper = new InvoiceLineItemTriggerHelper();
        helper.updateInvoicesWithAmountOfLineItems(new List<Invoice_Line_Item__c>(), lineItems);

        // Verify the results
        List<Invoice__c> updatedInvoices = [SELECT Amount_of_line_items__c FROM Invoice__c WHERE Id IN :invoices];
        System.assertEquals(2, updatedInvoices[0].Amount_of_line_items__c);
        System.assertEquals(1, updatedInvoices[1].Amount_of_line_items__c);
        System.assertEquals(1, updatedInvoices[2].Amount_of_line_items__c);
    }
}