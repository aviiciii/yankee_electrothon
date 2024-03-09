class UserDetails{
  final String ?id;
  final String food;
  final String date;
  final String time;

  const UserDetails(
    {this.id, required this.food,required this.date,required this.time}
  );

  UserDetails.fromJson(Map<String, dynamic> data): 
    id = data['id'],
    food = data['food'],
    date = data['date'],
    time = data['time'];

  UserDetails copyWith({String ?id, String ?food, String ?date, String ?time}){
    return UserDetails(
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

