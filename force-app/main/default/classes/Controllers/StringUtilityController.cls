public with sharing class StringUtilityController {
    @AuraEnabled
    public static List<String> sortStringEntries(List<String> stringEntries, Boolean descending) {
        try{
            
            if(descending){
                return StringUtility.sortStringsDescendingBasedOnLength(stringEntries);
            }

            return StringUtility.sortStringsAscendingBasedOnLength(stringEntries); 

        } catch (Exception e){
            throw new AuraHandledException('Should be custom label');
        }
    }
}