public with sharing class StringUtility {

    public static List<String> sortStringsAscendingBasedOnLength(List<String> stringsToSort){

        List<ComparableString> comparableEntries = ComparableString.createListOfComparableStrings(stringsToSort);
        comparableEntries.sort();

        return ComparableString.getListOfStringsFromEntries(comparableEntries);
    }

    public static List<String> sortStringsDescendingBasedOnLength(List<String> stringsToSort){

        List<ComparableString> comparableEntries = ComparableString.createListOfComparableStrings(stringsToSort);
        ComparableString.enableDescending();
        comparableEntries.sort();

        return ComparableString.getListOfStringsFromEntries(comparableEntries);

        }

}