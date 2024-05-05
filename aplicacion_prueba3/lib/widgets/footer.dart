import 'package:flutter/material.dart';

class MyFooter extends StatelessWidget {
  const MyFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        children: [
          _buildFooterItem('CONTÁCTANOS: techstore@test.com'),
          SizedBox(width: 10),
          _buildFooterLogo(),
        ],
      ),
    );
  }

  Widget _buildFooterItem(String text) {
    return Flexible(
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildFooterLogo() {
    return Container(
      color: Colors.white,
      child: Image.network(
        'https://firebasestorage.googleapis.com/v0/b/prueba3-72c15.appspot.com/o/logo.jpg?alt=media',
        width: 40,
        height: 40,
      ),
    );
  }
}