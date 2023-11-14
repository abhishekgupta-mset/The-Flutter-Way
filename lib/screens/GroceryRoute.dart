import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tip_calculator/screens/ProfileScreen.dart';

class GroceryRoute extends StatelessWidget {


  const GroceryRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open Profile'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );          },
        ),
      ),
    );
  }
}

