@IsTest
public class StringUtilityControllerTest {

    @IsTest
    public static void testSortStringEntriesAscending() {
        List<String> stringEntries = new List<String>{
            '1', '22', '333'
        };

        List<String> sortedStrings = StringUtilityController.sortStringEntries(stringEntries, false);

        System.assertEquals(3, sortedStrings.size());
        System.assertEquals('1', sortedStrings[0]);
        System.assertEquals('22', sortedStrings[1]);
        System.assertEquals('333', sortedStrings[2]);
    }

    @IsTest
    public static void testSortStringEntriesDescending() {
        List<String> stringEntries = new List<String>{
            '1', '22', '333'
        };

        List<String> sortedStrings = StringUtilityController.sortStringEntries(stringEntries, true);

        System.assertEquals(3, sortedStrings.size());
        System.assertEquals('333', sortedStrings[0]);
        System.assertEquals('22', sortedStrings[1]);
        System.assertEquals('1', sortedStrings[2]);
    }

    @IsTest
    public static void testSortStringEntriesException() {
        List<String> stringEntries = new List<String>{
            '1', '22', '333'
        };

        Test.startTest();
        try {
            List<String> sortedStrings = StringUtilityController.sortStringEntries(stringEntries, null);
            // If the code reaches this point, the exception was not thrown
            System.assert(false, 'Expected exception was not thrown');
        } catch (AuraHandledException e) {
            System.assert(true);
        }
        Test.stopTest();
    }
}