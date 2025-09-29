import 'package:flutter/material.dart';
import 'login.dart';
import 'sign_up.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Welcome', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/black_cart.jpg', width: MediaQuery.of(context).size.width * 0.35, height: MediaQuery.of(context).size.height * 0.25, fit: BoxFit.cover),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.06),
                  Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS73eMbUxJk9Sgk34If8XxtJ7apJlJS9EfLhA&s', width: MediaQuery.of(context).size.width * 0.35, height: MediaQuery.of(context).size.height * 0.25, fit: BoxFit.cover),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.06),
              Text('Welcome to Amagino', style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.06, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 58, 104, 183))),
              SizedBox(height: MediaQuery.of(context).size.height*0.03),

              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 600),
                      pageBuilder: (context, animation, secondaryAnimation) => const LoginPage(),
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('Sign In', style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.03))
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 600),
                      pageBuilder: (context, animation, secondaryAnimation) => const SignUpPage(),
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        final slide = Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero).animate(animation);
                        final fade = Tween<double>(begin: 0, end: 1).animate(animation);
                        return SlideTransition(
                          position: slide,
                          child: FadeTransition(
                            opacity: fade,
                            child: child,
                          ),
                        );
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 37, 235, 239),
                  minimumSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('Sign Up', style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.03)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
