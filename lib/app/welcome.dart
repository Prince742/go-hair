import 'package:flutter/material.dart';
import 'package:go_hair/pages/auth/register.dart';
import 'package:go_hair/pages/auth/login.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body:SingleChildScrollView(
        child:Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xfffbb448), Color(0xffe46b10)])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              _title(),
              SizedBox(
                height: 40,
              ),
              (orientation == Orientation.portrait)
                  ? Container(
                child: Image.asset("assets/undraw_barber_3uel_sur_vide.png"),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),)
                  : Text(''),
              SizedBox(
                height: 20,
              ),
              _LoginButton(),
              SizedBox(
                height: 20,
              ),
              _signUpButton(),
              SizedBox(
                height: 20,
              ),
              _description(),
            ],
          ),
        ),
      ),
    );

  }





  Widget _LoginButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color(0xffdf8e33).withAlpha(100),
                  offset: Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            color: Colors.white),
        child: Text(
          'Connexion',
          style: TextStyle(fontSize: 20, color: Color(0xfff7892b)),
        ),
      ),
    );
  }

  Widget _signUpButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RegisterPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Text(
          'Inscription',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _socialLoginButton() {
    return Container(
        margin: EdgeInsets.only(top: 40, bottom: 20),
        child: Column(
          children: <Widget>[
            Text(
              'Quick login with Touch ID',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            SizedBox(
              height: 20,
            ),
            Icon(Icons.fingerprint, size: 90, color: Colors.white),
            SizedBox(
              height: 20,
            ),
            Text(
              'Touch ID',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ));
  }


  Widget _description() {
    return Container(
        margin: EdgeInsets.only(top: 20, bottom: 10),
        child: Column(
          children: <Widget>[
            Text(
              'Votre salon de coiffure digital',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          ],
        ));
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Go',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          children: [
            TextSpan(
              text: 'H',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'air',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ]),
    );
  }


}
