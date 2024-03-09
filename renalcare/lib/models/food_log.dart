import 'package:cloud_firestore/cloud_firestore.dart';

class FoodLog{
  final String ?id;
  final String food;
  final String date;
  final String time;

  const FoodLog(
    {this.id, required this.food,required this.date,required this.time}
  );

  FoodLog fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot){
    return FoodLog(
      id: snapshot.id,
      food: snapshot['food'],
      date: snapshot['date'],
      time: snapshot['time'],
    );
  }

  FoodLog.fromJson(Map<String, dynamic> json)
    : id = json['id'] as String,
      food = json['food'] as String,
      date = json['date'] as String,
      time = json['time'] as String;

  FoodLog copyWith({String ?id, String ?food, String ?date, String ?time}){
    return FoodLog(
      id: id ?? this.id,
      food: food ?? this.food,
      date: date ?? this.date,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'food': food,
      'date': date,
      'time': time,
    };
  }

}

