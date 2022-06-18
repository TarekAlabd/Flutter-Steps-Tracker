class StepsAndPointsModel {
  final String id;
  final int steps;
  final int points;

  const StepsAndPointsModel({
    required this.id,
    required this.steps,
    required this.points,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'steps': steps,
      'points': points,
    };
  }

  factory StepsAndPointsModel.fromMap(
    Map<String, dynamic> map,
    String documentId,
  ) {
    return StepsAndPointsModel(
      id: documentId,
      steps: map['steps'] as int,
      points: map['points'] as int,
    );
  }
}
