class TopStore {
  final int number;
  final String storeName;
  final Map<String, String> detail;

  const TopStore({this.number, this.storeName, this.detail})
      : assert(number != null),
        assert(storeName != null),
        assert(detail != null);
}
