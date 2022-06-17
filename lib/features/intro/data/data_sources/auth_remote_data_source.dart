import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_steps_tracker/core/data/data_sources/data_sources_body.dart';
import 'package:flutter_steps_tracker/features/intro/data/services/auth_services.dart';
import 'package:injectable/injectable.dart';

abstract class AuthRemoteDataSource {
  Future<User?> signInAnonymously();
}

@Singleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final AuthBase authBase;

  AuthRemoteDataSourceImpl({required this.authBase});

  @override
  Future<User?> signInAnonymously() async => returnOrThrow(
        () => authBase.signInAnonymously(),
      );
}
