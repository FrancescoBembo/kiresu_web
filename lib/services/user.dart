import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kiresu_web/models/user.dart' as u;

class UserService {
  final String uid;

  UserService({required this.uid});

  // Collection Reference
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future newUser(u.User user) async {
    var doc = usersCollection.doc();
    return await doc.set({
      'uid': doc.id,
      'fName': user.fName,
      'lName': user.lName,
      'dOB': user.dOB,
      'photoID_url': user.photoID_url,
      'photo_url': user.photo_url,
      'gesture': user.gesture,
      'validityFrom': user.validityFrom,
      'validityTo': user.validityTo,
      'keepData': user.keepData
    });
  }

  Stream<List<u.User>> get users {
    return usersCollection.snapshots().map(_userFromSnapshot);
  }

  List<u.User> _userFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return u.User(
          uid: doc.data()['uid'] ?? '',
          fName: doc.data()['fName'] ?? '',
          lName: doc.data()['lName'] ?? '',
          dOB: doc.data()['dOB'] ?? '',
          photoID_url: doc.data()['photoID_url'] ?? '',
          photo_url: doc.data()['photo_url'] ?? '',
          gesture: doc.data()['gesture'] ?? '',
          validityFrom: doc.data()['validityFrom'] ?? '',
          validityTo: doc.data()['validityTo'] ?? '',
          keepData: doc.data()['keepData'] ?? null);
    }).toList();
  }

  Future deleteUser() {
    return usersCollection.doc(uid).delete();
  }
}
