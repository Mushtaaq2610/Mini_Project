import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';

class Auth{
  //creating new instance of firebase auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> registerWithEmailandPassword(
      String email,String password
      )
  async {
    await _auth.createUserWithEmailAndPassword(email:email,
      password:password,
    );
    //we can also store the user in a database
  }


  Future<void> signInWithEmailandPassword(String email,String password)async{
    final user = await _auth.signInWithEmailAndPassword(email:email,
      password:password,);
    //we can also store the user in a database

  }

  Future<void> signOut() async {
    await _auth.signOut();
  }


}