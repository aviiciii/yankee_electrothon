class UserDetails{
  final String ?id;
  final String name;
  final String email;
  final String phone;

  
  const UserDetails(
    {this.id, required this.name,required this.email,required this.phone}
  );

  UserDetails.fromMap(Map<String, dynamic> data):
    id = data['id'],
    name = data['name'],
    email = data['email'],
    phone = data['phone'];

  Map<String, dynamic> toMap(){
    return {
      'name': name,
      'email': email,
      'phone': phone,
    };
  }
}