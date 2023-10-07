import 'package:flutter/material.dart';

class TierraApp extends StatelessWidget {
  const TierraApp({super.key});

  static const routeName = '/tierra';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: Center(child: Text('Bienvenido a la Tierra!')),
    );
  }
}
