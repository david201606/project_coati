import 'package:flutter/material.dart';
import '../utils/auth_service.dart';
import '../utils/dialogs.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool passwordVisibility = true;

  String email = '', password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Inicio de Sesión',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Correo',
                filled: false,
                fillColor: Colors.indigo[50],
                labelStyle: const TextStyle(fontSize: 18),
                contentPadding: const EdgeInsets.only(left: 30),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                prefixIcon: const Icon(
                  Icons.alternate_email_rounded,
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                onFieldSubmitted: email != '' && password != ''
                    ? (value) {
                        MyDialogs().progressDialog('Iniciando sesión', context);
                        AuthService().signIn(email, password, context);
                      }
                    : null,
                obscureText: passwordVisibility,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  filled: false,
                  fillColor: Colors.indigo[50],
                  labelStyle: const TextStyle(fontSize: 18),
                  contentPadding: const EdgeInsets.only(left: 30),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                  prefixIcon: const Icon(
                    Icons.lock_rounded,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        passwordVisibility = !passwordVisibility;
                      });
                    },
                    icon: passwordVisibility
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Container(
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  primary: Theme.of(context).colorScheme.onPrimary,
                backgroundColor:  Theme.of(context).colorScheme.primary,
                ),
                onPressed: email != '' && password != ''
                    ? () async {
                        MyDialogs().progressDialog('Iniciando sesión', context);

                        AuthService().signIn(email, password, context);
                      }
                    : null,
                child: const Text('Entrar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
