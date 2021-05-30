import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'root_page.dart';
import 'auth.dart';

void main() => runApp(new App());

class App extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    print(_initialization);
    return new MaterialApp(
        title: 'Flutter Login',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder(
            // Initialize FlutterFire:
            future: _initialization,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return RootPage(auth: new Auth());
              }
              print(snapshot.connectionState);
              return Text(
                'Hello, Alex! How are you?',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              );
            }));
  }
}
