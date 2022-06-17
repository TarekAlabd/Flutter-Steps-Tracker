class APIPath {
  static String user(String uid) => 'users/$uid';

  static String rewards() => 'rewards/';

  static String exchangeHistory(String uid, String exchangeId) =>
      'users/$uid/exchanges/$exchangeId';

  static String exchangesHistory(String uid) => 'users/$uid/exchanges/';
}
