import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:renalcare/models/food_log.dart';

const String COLLECTION_REF = 'UserDetail';
const String FOOD_LOG_COLLECTION_REF = 'FoodLog';

class DatabaseService {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _foodLogCollectionReference;

  DatabaseService(document_id) {
    _foodLogCollectionReference = _firestore
        .collection(COLLECTION_REF)
        .doc(document_id)
        .collection(FOOD_LOG_COLLECTION_REF)
        .withConverter<FoodLog>(
            fromFirestore: (snapshots, _) => FoodLog.fromJson(
                  snapshots.data()!,
                ),
            toFirestore: (foodLog, _) => foodLog.toJson());
  }


  Stream<QuerySnapshot> get_food_logs() {
    return _foodLogCollectionReference.snapshots();
  }

  void add_food_log(FoodLog foodLog) {
    _foodLogCollectionReference.add(foodLog);
  }
}
