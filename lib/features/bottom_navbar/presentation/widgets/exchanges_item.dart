import 'package:flutter/material.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/data/models/exchange_history_model.dart';
import 'package:flutter_steps_tracker/utilities/constants/enums.dart';
import 'package:intl/intl.dart';

class ExchangesItem extends StatelessWidget {
  final ExchangeHistoryModel exchangeHistoryItem;

  const ExchangesItem({
    Key? key,
    required this.exchangeHistoryItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final date =
        DateFormat.yMMMMd().format(DateTime.parse(exchangeHistoryItem.date));
    return ListTile(
      title: Text(
        exchangeHistoryItem.title == ExchangeHistoryTitle.exchange.title
            ? exchangeHistoryItem.title
            : '${exchangeHistoryItem.points} points ${exchangeHistoryItem.title}',
      ),
      subtitle: Text(
        date,
      ),
      leading: Image.network(
        exchangeHistoryItem.title == ExchangeHistoryTitle.exchange.title
            ? 'https://g.top4top.io/p_2359tsmp22.png'
            : 'https://f.top4top.io/p_23591c6wg1.png',
      ),
    );
  }
}
