import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mapwatch/constants.dart';
import 'package:mapwatch/pages/main_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: FirebasePreloader()));
}

/// We are using a StatefulWidget such that we only create the [Future] once,
/// no matter how many times our widget rebuild.
/// If we used a [StatelessWidget], in the event where [App] is rebuilt, that
/// would re-initialize FlutterFire and make our application re-enter loading state,
/// which is undesired.
class FirebasePreloader extends StatefulWidget {
  @override
  _FirebasePreloaderState createState() => _FirebasePreloaderState();
}

class _FirebasePreloaderState extends State<FirebasePreloader> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          throw Exception('FirebaseApp ERROR: ${snapshot.error}');
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }

        // Otherwise, show a loading spinner while it's loading
        return MaterialApp(
          home: Scaffold(
            body: SpinKitWave(
              color: Colors.black,
              size: 30,
            ),
          ),
        );
      },
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primaryColor: CustomColorScheme.primaryColor,
      ),
      home: MainPageWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}
