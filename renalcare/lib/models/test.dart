class UserDetails{
  final String ?id;
  final String name;
  final String email;
  final String phone;

  
  const UserDetails(
    {this.id, required this.name,required this.email,required this.phone}
  );

  UserDetails.fromJson(Map<String, dynamic> data): 
    id = data['id'],
    name = data['name'],
    email = data['email'],
    phone = data['phone'];

  UserDetails copyWith({String ?id, String ?name, String ?email, String ?phone}){
    return UserDetails(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'name': name,
      'email': email,
      'phone': phone,
    };
  }

   
}