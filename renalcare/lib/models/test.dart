class UserDetails{
  final String ?id;
  final String email;
  final String phone;
  final String uid;

  
  const UserDetails(
    {this.id, required this.email,required this.phone,required this.uid}
  );

  UserDetails.fromJson(Map<String, dynamic> data): 
    id = data['id'],
    email = data['email'],
    phone = data['phone'],
    uid = data['uid'];

  UserDetails copyWith({String ?id, String ?email, String ?phone, String ?uid}){
    return UserDetails(
      id: id ?? this.id,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'email': email,
      'phone': phone,
      'uid': uid,
    };
  }

   
}