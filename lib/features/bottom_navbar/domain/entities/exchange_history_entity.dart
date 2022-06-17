import 'package:equatable/equatable.dart';

class ExchangeHistoryEntity extends Equatable {
  final String id;
  final String title;
  final DateTime date;

  const ExchangeHistoryEntity({
    required this.id,
    required this.title,
    required this.date,
  });

  @override
  List<Object?> get props => [id];
}
