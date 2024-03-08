import 'package:flutter/material.dart';

class food extends StatelessWidget {
  const food({super.key});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: Text(
          'Test',
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
    child: Stack(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: Image.network(
            'https://p1.hiclipart.com/preview/653/92/937/indian-food-idli-sambar-indian-cuisine-rava-idli-south-indian-cuisine-breakfast-dal-png-clipart.jpg',
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Container(
            alignment: Alignment.center,
            child: Text(
              'Idly & Sambar',
              style: TextStyle(color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0),
            )),
      ],
    ),
  ),
    );
  }
}