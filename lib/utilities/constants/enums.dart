enum AuthStatus { authenticated, unAuthenticated }

enum ExchangeHistoryTitle {
  exchange(
      'Congratulations, you gained more 5 health points because of your footsteps!'),
  reward('were taken from your health points because of the reward!');

  final String title;

  const ExchangeHistoryTitle(this.title);
}
