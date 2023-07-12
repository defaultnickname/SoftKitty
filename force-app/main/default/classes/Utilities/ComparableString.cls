public class ComparableString implements Comparable {
    public String entry { get; set; }
    public static Boolean descendingSort = false;

    public ComparableString(String entry){
        this.entry = entry;
    }

    public static List<ComparableString> createListOfComparableStrings(List<String> stringEntries) {
        List<ComparableString> entries = new List<ComparableString>();
        for(String s : stringEntries){
            entries.add(new ComparableString(s));
        }
        return entries;
    }

    public static List<String> getListOfStringsFromEntries(List<ComparableString> stringEntries) {
        List<String> entries = new List<String>();

        for(ComparableString cs : stringEntries){
            entries.add(cs.entry);
        }

        return entries;
    }
  
    public static void enableDescending() {
        descendingSort = true;
    }
  
    public static void enableAscending() {
        descendingSort = false;
    }
  
    public Integer compareTo(Object compareTo) {
        ComparableString compareToString = (ComparableString) compareTo;
        Integer isGreater =  
            this.entry.length() > compareToString.entry?.length() ?
                1 : this.entry.length() < compareToString.entry?.length() ?
                    -1 : 0;

        if (descendingSort) {
            return -isGreater;
        }
        return isGreater;

    }
  
  }