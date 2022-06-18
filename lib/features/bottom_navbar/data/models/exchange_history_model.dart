import 'package:equatable/equatable.dart';

// TODO: We will use this model as an entity too just for simplicity now
class ExchangeHistoryModel extends Equatable {
  final String id;
  final String title;
  final String date;
  final int points;

  const ExchangeHistoryModel({
    required this.id,
    required this.title,
    required this.date,
    required this.points,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'date': date,
      'points': points,
    };
  }

  factory ExchangeHistoryModel.fromMap(
    Map<String, dynamic> map,
    String documentId,
  ) {
    return ExchangeHistoryModel(
      id: documentId,
      title: map['title'] as String,
      date: map['date'] as String,
      points: map['points'] as int,
    );
  }

  @override
  List<Object?> get props => [id];
}
