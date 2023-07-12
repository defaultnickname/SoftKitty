@IsTest
public class ComparableStringTest {

    @IsTest
    public static void testCreateListOfComparableStrings() {
        List<String> stringEntries = new List<String>{
            'apple', 'banana', 'cherry'
        };

        List<ComparableString> comparableStrings = ComparableString.createListOfComparableStrings(stringEntries);

        System.assertEquals(3, comparableStrings.size());
        System.assertEquals('apple', comparableStrings[0].entry);
        System.assertEquals('banana', comparableStrings[1].entry);
        System.assertEquals('cherry', comparableStrings[2].entry);
    }

    @IsTest
    public static void testGetListOfStringsFromEntries() {
        List<ComparableString> stringEntries = new List<ComparableString>{
            new ComparableString('apple'),
            new ComparableString('banana'),
            new ComparableString('cherry')
        };

        List<String> entries = ComparableString.getListOfStringsFromEntries(stringEntries);

        System.assertEquals(3, entries.size());
        System.assertEquals('apple', entries[0]);
        System.assertEquals('banana', entries[1]);
        System.assertEquals('cherry', entries[2]);
    }

    @IsTest
    public static void testEnableDescending() {
        ComparableString.enableDescending();
        System.assertEquals(true, ComparableString.descendingSort);
    }

    @IsTest
    public static void testEnableAscending() {
        ComparableString.enableAscending();
        System.assertEquals(false, ComparableString.descendingSort);
    }

    @IsTest
    public static void testCompareTo() {
        ComparableString cs1 = new ComparableString('apple');
        ComparableString cs2 = new ComparableString('banana');
        ComparableString cs3 = new ComparableString('cherry');

        Integer result1 = cs1.compareTo(cs2);
        Integer result2 = cs2.compareTo(cs1);
        Integer result3 = cs2.compareTo(cs3);

        System.assertEquals(-1, result1);
        System.assertEquals(1, result2);
        System.assertEquals(0, result3);
    }
}