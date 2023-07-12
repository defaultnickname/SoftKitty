@IsTest
public class StringUtilityTest {

    @IsTest
    public static void testSortStringsAscendingBasedOnLength() {
        List<String> stringsToSort = new List<String>{
            '1', '22', '333'
        };

        List<String> sortedStrings = StringUtility.sortStringsAscendingBasedOnLength(stringsToSort);

        System.assertEquals(3, sortedStrings.size());
        System.assertEquals('1', sortedStrings[0]);
        System.assertEquals('22', sortedStrings[1]);
        System.assertEquals('333', sortedStrings[2]);
    }

    @IsTest
    public static void testSortStringsDescendingBasedOnLength() {
        List<String> stringsToSort = new List<String>{
            '1', '22', '333'
        };

        List<String> sortedStrings = StringUtility.sortStringsDescendingBasedOnLength(stringsToSort);
        System.debug(sortedStrings);
        System.assertEquals(3, sortedStrings.size());
        System.assertEquals('333', sortedStrings[0]);
        System.assertEquals('22', sortedStrings[1]);
        System.assertEquals('1', sortedStrings[2]);
    }
}