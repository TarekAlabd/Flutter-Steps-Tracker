import 'package:flutter_steps_tracker/features/bottom_navbar/data/models/exchange_history_model.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/domain/entities/exchange_history_entity.dart';

extension ExchangeHistoryToModelMapper on ExchangeHistoryEntity {
  ExchangeHistoryModel toModel() {
    return ExchangeHistoryModel(
      id: id,
      title: title,
      date: date.toString(),
    );
  }
}
