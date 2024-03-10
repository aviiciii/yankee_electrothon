import 'package:flutter/material.dart';

class OnboardingUserDetail7 extends StatefulWidget {
  @override
  OnboardingUserDetail7State createState() => OnboardingUserDetail7State();
}

class OnboardingUserDetail7State extends State<OnboardingUserDetail7> {
  int frequency = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter the frequency of your dialysis:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (frequency > 0) {
                        frequency--;
                      }
                    });
                  },
                ),
                Text(
                  '$frequency',
                  style: TextStyle(fontSize: 24),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      frequency++;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ;
                  },
                  child: Icon(Icons.arrow_forward_outlined),
                ),
                SizedBox(width: 40),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
