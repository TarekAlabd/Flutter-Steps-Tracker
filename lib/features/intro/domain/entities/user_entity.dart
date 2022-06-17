import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? uid;
  final String name;

  const UserEntity({
    this.uid,
    required this.name,
  });

  @override
  List<Object?> get props => [uid, name];
}
