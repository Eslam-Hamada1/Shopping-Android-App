import 'package:flutter/material.dart';
import 'home.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isGoodToGo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Sign Up", style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: Form(
        key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: userController,
                  validator: (value) {
                    if(value != null && value.isEmpty) {
                      return "Full name can't be empty";
                    } else if(value!= null && value[0] != value[0].toUpperCase()) {
                      return "Full name must start with an UPPER CASE letter";
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Full Name'),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if(value != null && value.isEmpty) {
                      return "Email can't be empty";
                    } 
                    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                    if (!emailRegex.hasMatch(value as String)) {
                      return "Invalid email format";
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Email'),
                ),
              ),
              
              Padding(
                padding: EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: passController,
                  validator: (value) {
                    if(value != null && value.isEmpty) {
                      return "Password can't be empty";
                    } else if(value!= null && value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password'),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: confirmPassController,
                  validator: (value) {
                    if(value != null && (value.isEmpty || value != passController.text)) {
                      return "Passwords must match";
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Confirm Password'),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.05),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    dialog('Welcome', 'Account created successfully', 'Close', true);
                  } else {
                    dialog('Invalid Credentials', 'Please recheck the fields', 'OK', false);
                  }
                },
                child: Text("Sign Up", style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.03)),
              ),
            ],
          )
        ),
    );
  }

  Future<void> dialog(title, content, buttonText, isGoodToGo) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () { 
                isGoodToGo ? Navigator.pushReplacement(context, PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => const HomePage(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    transitionDuration: const Duration(milliseconds: 600),
                  ),
                )
                : Navigator.of(context).pop();
              },
              child: Text(buttonText),
            ),
          ],
        );
      }
    );
  }
}