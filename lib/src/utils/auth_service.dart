import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../nav/menu_page.dart';
import '../utils/dialogs.dart';
import '../utils/user_preferences.dart';

class AuthService {
  final UserPreferences _prefs = UserPreferences();

  Future<Future<bool?>> signIn(
      String email, String password, BuildContext context) async {
    return FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((UserCredential userValue) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const MenuPage()),
          (Route<dynamic> route) => false);
      FirebaseFirestore.instance
          .collection('users')
          .doc(userValue.user!.uid)
          .get()
          .then((userData) {
        _prefs.userID = userValue.user!.uid;
        _prefs.userName = userData.data()!['name'];
        _prefs.userEmail = userData.data()!['email'];
/*        _prefs.userAdmin = userData.data()!['admin'];
        _prefs.userProfileImage = userData.data()!['photo'];*/

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const MenuPage()),
            (Route<dynamic> route) => false);
        return true;
      });
    }).onError((FirebaseAuthException error, stackTrace) async {
      switch (error.code) {
        case 'invalid-credential':
          Navigator.pop(context);
          MyDialogs().MessageDialog(context,
              icon: Icons.account_box_outlined,
              title: 'Hum...',
              body: 'Credencial invalida');
          break;
        case 'invalid-email':
          Navigator.pop(context);
          MyDialogs().MessageDialog(context,
              icon: Icons.mark_email_unread_outlined,
              title: 'Correo invalido',
              body: 'Introduzca un correo valido, "ejemplo@ejemplo.com"');
          break;
        case 'operation-not-allowed':
          MyDialogs().MessageDialog(context,
              icon: Icons.notification_important_outlined,
              title: 'Oops',
              body: 'No tienes permisos para entrar');
          break;

        case 'user-disabled':
          Navigator.pop(context);
          MyDialogs().MessageDialog(context,
              icon: Icons.person_remove_alt_1_outlined,
              title: 'Oops',
              body: 'Usuario desactivado');
          break;

        case 'user-not-found':
          Navigator.pop(context);

          MyDialogs().MessageDialog(context,
              icon: Icons.person_search_outlined,
              title: 'Hum...',
              body: 'No se ha encontrado este usuario');
          break;

        case 'wrong-password':
          Navigator.pop(context);
          MyDialogs().MessageDialog(context,
              icon: Icons.password,
              title: 'Hum...',
              body: 'Contraseña incorrecta');
          break;

        default:
          Navigator.pop(context);

          MyDialogs().MessageDialog(context,
              icon: Icons.warning_outlined,
              title: 'Error desconocido',
              body:
                  'Algo salio mal, no estamos seguros de que paso ${error.code}');

          break;
      }
    });
  }

  Future<bool> reauthenticate(
      {required String email,
      required String password,
      required BuildContext context}) async {
    AuthCredential credential =
        EmailAuthProvider.credential(email: email, password: password);
    return FirebaseAuth.instance.currentUser!
        .reauthenticateWithCredential(credential)
        .then((userValue) {
      return true;
    }).onError((FirebaseAuthException error, stackTrace) async {
      switch (error.code) {
        case 'invalid-credential':
          Navigator.pop(context);
          MyDialogs().MessageDialog(context,
              icon: Icons.info, title: 'Hum...', body: 'Credencial invalida');
          break;
        case 'operation-not-allowed':
          MyDialogs().MessageDialog(context,
              icon: Icons.info,
              title: 'Oops',
              body: 'No tienes permisos para entrar');
          break;

        case 'user-disabled':
          Navigator.pop(context);
          MyDialogs().MessageDialog(context,
              icon: Icons.info, title: 'Oops', body: 'Usuario desactivado');
          break;

        case 'user-not-found':
          Navigator.pop(context);

          MyDialogs().MessageDialog(context,
              icon: Icons.info,
              title: 'Hum...',
              body: 'No se ha encontrado este usuario');
          break;

        case 'wrong-password':
          Navigator.pop(context);
          MyDialogs().MessageDialog(context,
              icon: Icons.password,
              title: 'Hum...',
              body: 'Contraseña incorrecta');
          break;

        default:
          Navigator.pop(context);

          MyDialogs().MessageDialog(context,
              icon: Icons.info,
              title: 'Error desconocido',
              body:
                  'Algo fue mal, no estamos seguros de que paso\n${error.code}');

          break;
      }

      return false;
    });
  }

  Future<bool> signOut() async {
    return FirebaseAuth.instance.signOut().then((value) {
      _prefs.clearAllPreferences();
      return true;
    }).onError((error, stackTrace) {
      return false;
    });
  }

  Future<void> signUp(
      {required String email,
      required String password,
      required String name,
      required bool admin,
      required BuildContext context}) async {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((user) {
      FirebaseFirestore.instance.collection('users').doc(user.user?.uid).set({
        'info': {
          'name': name,
          'email': email,
        },
        'admin': admin,
        'active': true
      }).then((value) {
        Navigator.pop(context);
        Navigator.pop(context);
      });
    });
  }
}
