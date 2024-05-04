import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/header.dart';
import 'package:flutter_application_1/widgets/footer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyHeader(), // Usa el header
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Aquí está el body',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          MyFooter(), // Usa el footer
        ],
      ),
    );
  }
}
