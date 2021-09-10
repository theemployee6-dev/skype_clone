import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skype_clone/constants/strings.dart';
import 'package:skype_clone/models/call.dart';

class CallMethods {
  final CollectionReference callcollection =
      Firestore.instance.collection(CALL_COLLECTION);

  Stream<DocumentSnapshot> callStream({String uid}) =>
      callcollection.document(uid).snapshots();

  Future<bool> makeCall({Call call}) async {
    try {
      call.hasDialled = true;
      Map<String, dynamic> hasDialledMap = call.toMap(call);

      call.hasDialled = false;
      Map<String, dynamic> hasNotDialledMap = call.toMap(call);

      await callcollection.document(call.callerId).setData(hasDialledMap);

      await callcollection.document(call.receiverId).setData(hasNotDialledMap);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> endCall({Call call}) async {
    try {
      await callcollection.document(call.callerId).delete();
      await callcollection.document(call.receiverId).delete();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
