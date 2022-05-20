import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/pages/home/home_view_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGİN'),
      ),
      body: HomeViewModel(),
    );
  }
}
