import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:renalcare/models/test.dart';

const String COLLECTION_REF = 'UserDetail';

class DatabaseService {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _collectionReference;

  DatabaseService() {
    _collectionReference =
        _firestore.collection(COLLECTION_REF).withConverter<UserDetails>(
            fromFirestore: (snapshots, _) => UserDetails.fromJson(
                  snapshots.data()!,
                ),
            toFirestore: (userDetails, _) => userDetails.toJson());
  }

  Stream<QuerySnapshot> get_users() {
    return _collectionReference.snapshots();
  }

  void add_user(UserDetails userDetails) {
    _collectionReference.add(userDetails);
  }

}
