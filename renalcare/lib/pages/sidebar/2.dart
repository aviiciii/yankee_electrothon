import 'package:flutter/material.dart';
import 'package:renalcare/widgets/bottomnav.dart';

class personalInfo extends StatelessWidget {
  const personalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        "Statistics",
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "Mar 10",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text("Idli & Sambar"),
                                ),
                              ),
                            ),
                            const VerticalDivider(
                              width: 20,
                              thickness: 1,
                              indent: 0,
                              endIndent: 0,
                              color: Colors.grey,
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text("White Rice & Chicken"),
                              ),
                            ),
                            const VerticalDivider(
                              width: 20,
                              thickness: 1,
                              indent: 0,
                              endIndent: 0,
                              color: Colors.grey,
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text("Dosa and sambar"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      "MAR 09",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text("Idli & Sambar"),
                                ),
                              ),
                            ),
                            const VerticalDivider(
                              width: 20,
                              thickness: 1,
                              indent: 0,
                              endIndent: 0,
                              color: Colors.grey,
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text("White Rice & Chicken"),
                              ),
                            ),
                            const VerticalDivider(
                              width: 20,
                              thickness: 1,
                              indent: 0,
                              endIndent: 0,
                              color: Colors.grey,
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text("Dosa and sambar"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      "MAR 08",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text("Idli & Sambar"),
                                ),
                              ),
                            ),
                            const VerticalDivider(
                              width: 20,
                              thickness: 1,
                              indent: 0,
                              endIndent: 0,
                              color: Colors.grey,
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text("White Rice & Chicken"),
                              ),
                            ),
                            const VerticalDivider(
                              width: 20,
                              thickness: 1,
                              indent: 0,
                              endIndent: 0,
                              color: Colors.grey,
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text("Dosa and sambar"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNav(),
    );
  }
}
