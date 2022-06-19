import 'package:equatable/equatable.dart';

class LeaderboardItemEntity extends Equatable {
  final String uid;
  final String imageUrl;
  final String name;
  final int stepsNumber;
  final int order;
  final int healthPoints;

  const LeaderboardItemEntity({
    required this.uid,
    this.imageUrl =
        'https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg',
    required this.name,
    required this.stepsNumber,
    required this.order,
    required this.healthPoints,
  });

  @override
  List<Object?> get props => [uid];

  LeaderboardItemEntity copyWith({
    String? uid,
    String? imageUrl,
    String? name,
    int? stepsNumber,
    int? order,
    int? healthPoints,
  }) {
    return LeaderboardItemEntity(
      uid: uid ?? this.uid,
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      stepsNumber: stepsNumber ?? this.stepsNumber,
      order: order ?? this.order,
      healthPoints: healthPoints ?? this.healthPoints,
    );
  }
}
