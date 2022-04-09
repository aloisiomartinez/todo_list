import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list/app/repositories/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {

  FirebaseAuth _firebaseAuth;

  UserRepositoryImpl({ required FirebaseAuth firebaseAuth}) : _firebaseAuth = firebaseAuth;

  @override
  Future<User?> register(String email, String password) async {
    
    try {
      final userCredencial = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredencial.user;
    } on FirebaseAuthException catch(e,s) {
      print(e);
      print(s);
    }
  }

}