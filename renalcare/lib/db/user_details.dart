// class UserDetails{
//   final String ?id;
//   final String uid;
//   final String name;
//   final String email;
//   final String phone;
//   final String address;
//   final String role;
//   final String photoUrl;

//   const UserDetails(
//     {this.id, required this.uid, required this.name,required this.email,required this.phone,required this.address,required this.role,required this.photoUrl}
//   );

//   UserDetails.fromMap(Map<String, dynamic> data):
//     id = data['id'],
//     uid = data['uid'],
//     name = data['name'],
//     email = data['email'],
//     phone = data['phone'],
//     address = data['address'],
//     role = data['role'],
//     photoUrl = data['photoUrl'];

//   Map<String, dynamic> toMap(){
//     return {
//       'uid': uid,
//       'name': name,
//       'email': email,
//       'phone': phone,
//       'address': address,
//       'role': role,
//       'photoUrl': photoUrl
//     };
//   }
// }