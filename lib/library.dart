import 'package:flutter/material.dart';
import 'package:basemain/login.dart';
class Library extends StatelessWidget {
  final List<String> itemList = [ 'logout'];

  void _navigateToLoginScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
      body: ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(itemList[index]),
            trailing: ElevatedButton(
              onPressed: () => _navigateToLoginScreen(context),
              child: Text('logout'),
            ),
          );
        },
      ),
    );
  }
}

 

 