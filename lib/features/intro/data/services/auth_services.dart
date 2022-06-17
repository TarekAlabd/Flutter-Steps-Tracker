import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

abstract class AuthBase {
  Future<User?> signInAnonymously();
}

@Singleton(as: AuthBase)
class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<User?> signInAnonymously() async {
    if (_firebaseAuth.currentUser != null) {
      await _firebaseAuth.currentUser!.delete();
    }
    final userCredential = await _firebaseAuth.signInAnonymously();
    return userCredential.user;
  }
}
