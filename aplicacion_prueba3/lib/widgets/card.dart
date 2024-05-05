import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final double price;
  final String buttonText;
  final VoidCallback onPress;
  final String url;

  const CustomCard({
    Key? key,
    required this.title,
    required this.price,
    required this.buttonText,
    required this.onPress,
    required this.url
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onPress,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(
                url,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(height: 10),
              Text(
                'USD ${price.toStringAsFixed(2)}', // Format price as CLP
                style: Theme.of(context).textTheme.subtitle1,
              ),
              TextButton(onPressed: onPress, child: Text(buttonText))
            ],
          ),
        ),
      ),
    );
  }
}
