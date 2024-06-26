
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? _user;

  User? get user{
    return _user;
  }
  AuthService(){}

  Future<bool> login(String email, String password)async{
    print('Signing in with email and password');
    try{
     final credentials = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
     if(credentials.user != null){
       _user = credentials.user;
       return true;
     }
    }catch(e){
      print(e);
    }
    return false;
  }


}