import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Welcome', style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width*0.06)),
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
                  Image.asset(
                    'assets/black_cart.jpg',
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: MediaQuery.of(context).size.height * 0.25,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.06),
                  Image.network(
                    'https://cdn-icons-png.flaticon.com/512/263/263142.png',
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: MediaQuery.of(context).size.height * 0.25,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.06),
              Text('Welcome to Amagino', style: TextStyle(fontFamily: 'Suwannaphum', fontSize: MediaQuery.of(context).size.width * 0.06, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 58, 104, 183))),
              SizedBox(height: MediaQuery.of(context).size.height*0.03),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('Sign In', style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.042))
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 51, 255, 197),
                  minimumSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('Sign Up', style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.042)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
