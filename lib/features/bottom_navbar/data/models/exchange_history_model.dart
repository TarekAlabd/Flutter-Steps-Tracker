import 'package:equatable/equatable.dart';

// TODO: We will use this model as an entity too just for simplicity now
class ExchangeHistoryModel extends Equatable {
  final String id;
  final String title;
  final String date;

  const ExchangeHistoryModel({
    required this.id,
    required this.title,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'date': date,
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
    );
  }

  @override
  List<Object?> get props => [id];
}
