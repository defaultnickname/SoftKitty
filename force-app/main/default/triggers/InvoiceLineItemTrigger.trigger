trigger InvoiceLineItemTrigger on Invoice_Line_Item__c (after insert, after update, after delete, after undelete) {

        ITriggerHandler handler = new InvoiceLineItemTriggerHandler(Trigger.isExecuting, Trigger.size);
        switch on Trigger.operationType {
            when AFTER_INSERT {
                handler.afterInsert(Trigger.new, Trigger.newMap);
            }
            when AFTER_UPDATE {
                handler.afterUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);
            }
            when AFTER_DELETE {
                handler.afterDelete(Trigger.old, Trigger.oldMap);
            }
            when AFTER_UNDELETE {
                handler.afterUndelete(Trigger.new, Trigger.newMap);
            }
        }
    
}