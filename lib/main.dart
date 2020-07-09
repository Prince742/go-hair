import 'package:flutter/material.dart';
import 'package:go_hair/pages/auth/isAuthenticated.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Authentificated>.value(
      value: StreamProviderAuth().users,
      child: MaterialApp(
        title: 'Go Hair',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity,

        ),
        debugShowCheckedModeBanner: false,

        home: Passerelle(),
      ),
    );
  }
}
