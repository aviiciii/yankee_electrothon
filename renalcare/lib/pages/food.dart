import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class food extends StatelessWidget {
  const food({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            // alignment: Alignment.center,
            child: Image.network(
              'https://p1.hiclipart.com/preview/653/92/937/indian-food-idli-sambar-indian-cuisine-rava-idli-south-indian-cuisine-breakfast-dal-png-clipart.jpg',
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Text(
              "Idly & Sambar",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nutreint contents",
                    style: TextStyle(fontSize: 20),
                  ),
                  foodComponent("phosphorous", 10.00),
                  foodComponent("Potassium", 20.00),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding foodComponent(String component, double quantity) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(component),
            Row(
              children: [
                Container(
                  child: Text(quantity.toString()),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                ),
                SizedBox(width: 10),
                Text("mg")
              ],
            )
          ],
        ),
      ),
    );
  }
}
