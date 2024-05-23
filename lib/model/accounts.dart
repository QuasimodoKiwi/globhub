import 'package:cloud_firestore/cloud_firestore.dart';

class Account {
  String? email;
  String status = "New to this platform.";
  String? user_name;
  String? password;
  late DocumentReference? reference;

  Account.fromMap(Map<String, dynamic> map, {this.reference}) {
    email = map['email'];
    user_name = map['user_name'];
    password = map['password'];
  }

  Account.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>,
            reference: snapshot.reference);

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'user_name': user_name,
      'status': status,
      'password': password,
    };
  }

  set storeEmail(String? value) {
    email = value;
    reference?.update(toJson());
  }

  set storeName(String? value) {
    user_name = value;
    reference?.update(toJson());
  }

  set storePassword(String? value) {
    password = value;
    reference?.update(toJson());
  }

  void setUserName(String string) {
    user_name = string;
    reference?.update(toJson());
  }

  void setStatus(String string) {
    status = string;
    reference?.update(toJson());
  }
}
