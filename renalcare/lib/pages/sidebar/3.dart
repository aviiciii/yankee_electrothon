import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class learnCdk extends StatelessWidget {
  const learnCdk({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Center(
              child: Text(
                'Chronic Kidney Disease (CKD) Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center, // Added textAlign property
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              'CKD Level 1-5 Information',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center, // Added textAlign property
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              child: Center(
                child: Text(
                  'CKD Level 1: Kidney damage with normal or increased GFR (>=90 mL/min/1.73 m²)',
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center, // Added textAlign property
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              child: Center(
                child: Text(
                  'CKD Level 2: Kidney damage with mild decrease in GFR (60-89 mL/min/1.73 m²)',
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center, // Added textAlign property
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              child: Center(
                child: Text(
                  'CKD Level 3: Moderate decrease in GFR (30-59 mL/min/1.73 m²)',
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center, // Added textAlign property
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              'CKD Level 4: Severe decrease in GFR (15-29 mL/min/1.73 m²)',
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center, // Added textAlign property
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              child: Center(
                child: Text(
                  'CKD Level 5: Kidney failure (GFR <15 mL/min/1.73 m² or dialysis)',
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center, // Added textAlign property
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}