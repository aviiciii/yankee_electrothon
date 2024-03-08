import 'package:flutter/material.dart';
import 'package:renalcare/widgets/navbar.dart';
import 'package:renalcare/widgets/bottomnav.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        toolbarHeight: 100,
        centerTitle: true,
        // leading: const Icon(
        //   Icons.menu,
        //   size: 40,
        // ),
        title: const Text(
          "Welcome!",
          style: TextStyle(color: Colors.white, fontSize: 26),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Todays food menu
              const Text(
                "Today\'s Food Menu",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const Text(
                "BreakFast",
                style: TextStyle(fontSize: 20),
              ),

              Container(
                width: 350,
                margin: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Idli",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        SizedBox(width: 5),
                        Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(25)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Phosporous - 10.00 mg"),
                              Text("Potasium  - 10.00 mg"),
                              Text("Protein - 7g"),
                              Text("Sodium -7g"),
                              Text("Water -10 mg"),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.black),
                ),
                height: 200,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNav(),
    );
  }
}
