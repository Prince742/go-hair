import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  final String title = 'Connexion';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: [
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: LoginForm(),
            ),
          ],
        ),
      ),
    );
  }
}



class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _passwordVisible = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String _email;
  String _password;

  FirebaseAuth _auth = FirebaseAuth.instance;


  String _validateEmail(String value) {
    if (value.isEmpty || !EmailValidator.validate(value)) {
      return "Entrez un email valide svp";
    }
    return null;
  }

  String _validatePassword(String password) {
    if (password.isEmpty) {
      return "Entrez votre mot de passe";
    }
    return null;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }


  @override
  Widget build(BuildContext context) {

        return Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                validator: _validateEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Entrez votre email",
                  border: OutlineInputBorder(),
                ),
                onChanged: (String value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _passwordController,
                validator: _validatePassword,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(_passwordVisible ? Icons.visibility : Icons.visibility_off),
                    onPressed: _togglePasswordVisibility,
                  ),
                  labelText: "Entrez votre mot de passe",
                  border: OutlineInputBorder(),
                ),
                obscureText: !_passwordVisible,
                onChanged: (String value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
              SizedBox(height: 12),
              RaisedButton(
                color: Theme.of(context).accentColor,
                onPressed: () => _login(context),
                child: Text("Connexion".toUpperCase()),
              )
            ],
          ),
        );
  }


  void _login(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      print("On lance");
      AuthResult result = await _auth.signInWithEmailAndPassword(email: _email, password: _password);

      if (result == null) {
        // Message d'erreur
        print("Une erreur s'est produite lors de connexion");
      }
      print("Successss");
    }
  }
}
