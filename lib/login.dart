 import 'package:flutter/material.dart';
import 'package:basemain/homescreen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool pressed = false;
  double fontSize = 16.0;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  Future<bool> _onWillPop() async {
    final shouldPop = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Exit App'),
          content: const Text('Are you sure you want to exit?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );

    return shouldPop ?? false;
  }

  void _onButtonTap() {
    setState(() {
      pressed = !pressed;
      fontSize = pressed ? 20.0 : 16.0;
    });

    // Get the values of the name and email fields
    String name = _nameController.text.trim();
    String email = _emailController.text.trim();

    // Perform validation
    if (name.isEmpty || email.isEmpty) {
      // Show an error message or dialog to inform the user about the empty fields
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Please fill in all fields.'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return; // Stop the login action
    }

    // Continue with the login action
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 60),
              Image.asset("assets/images/1.png"),
              const SizedBox(height: 60),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your name',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your email',
                  ),
                ),
              ),
              InkWell(
                onTap: _onButtonTap,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(pressed ? 50 : 20.0),
                    color: pressed ? Colors.green : Colors.blue,
                  ),
                  child: Center(
                    child: pressed
                        ? const Icon(
                            Icons.check,
                            color: Colors.white,
                          )
                        : Text(
                            'Login',
                            style: TextStyle(fontSize: fontSize),
                          ),
                  ),
                ),
              ),
                 const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
