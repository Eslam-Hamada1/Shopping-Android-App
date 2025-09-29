import 'package:flutter/material.dart';
import 'package:shopping_app/Pages/home.dart';
import 'package:shopping_app/Pages/login.dart';
import 'package:shopping_app/Pages/sign_up.dart';
import 'package:shopping_app/Pages/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => WelcomePage(),
        '/home' : (context) => HomePage(),
        '/login' : (context) => LoginPage(),
        '/signup' : (context) => SignUpPage()
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 36, 72, 200)),
        fontFamily: 'Suwannaphum',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Title"),
      ),
    );
  }
}
