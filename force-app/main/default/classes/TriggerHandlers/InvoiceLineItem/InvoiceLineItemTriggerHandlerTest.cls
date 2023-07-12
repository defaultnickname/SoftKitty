@IsTest
public class InvoiceLineItemTriggerHandlerTest {


    @IsTest
    public static void testAfterInsert() {

        List<Invoice_Line_Item__c> newInvoices = new List<Invoice_Line_Item__c>{
            new Invoice_Line_Item__c(),
            new Invoice_Line_Item__c(),
            new Invoice_Line_Item__c()
        };

        InvoiceLineItemTriggerHandler handler = new InvoiceLineItemTriggerHandler(false, 3);
        Test.startTest();
        handler.afterInsert(newInvoices, new Map<Id, SObject>());
        Test.stopTest();

    }

    @IsTest
    public static void testAfterUpdate() {
        // Create test data
        List<Invoice_Line_Item__c> oldInvoices = new List<Invoice_Line_Item__c>{
            new Invoice_Line_Item__c(),
            new Invoice_Line_Item__c(),
            new Invoice_Line_Item__c()
        };
        List<Invoice_Line_Item__c> newInvoices = new List<Invoice_Line_Item__c>{
            new Invoice_Line_Item__c(),
            new Invoice_Line_Item__c(),
            new Invoice_Line_Item__c()
        };

        InvoiceLineItemTriggerHandler handler = new InvoiceLineItemTriggerHandler(false, 3);
        Test.startTest();
        handler.afterUpdate(oldInvoices, newInvoices, new Map<Id, SObject>(), new Map<Id, SObject>());
        Test.stopTest();

    }

    @IsTest
    public static void testAfterDelete() {

        List<Invoice_Line_Item__c> oldInvoices = new List<Invoice_Line_Item__c>{
            new Invoice_Line_Item__c(),
            new Invoice_Line_Item__c(),
            new Invoice_Line_Item__c()
        };


        InvoiceLineItemTriggerHandler handler = new InvoiceLineItemTriggerHandler(false, 3);
        Test.startTest();
        handler.afterDelete(oldInvoices, new Map<Id, SObject>());
        Test.stopTest();

    }

    @IsTest
    public static void testAfterUndelete() {

        List<Invoice_Line_Item__c> newInvoices = new List<Invoice_Line_Item__c>{
            new Invoice_Line_Item__c(),
            new Invoice_Line_Item__c(),
            new Invoice_Line_Item__c()
        };


        InvoiceLineItemTriggerHandler handler = new InvoiceLineItemTriggerHandler(false, 3);
        Test.startTest();
        handler.afterUndelete(newInvoices, new Map<Id, SObject>());
        Test.stopTest();


    }
}