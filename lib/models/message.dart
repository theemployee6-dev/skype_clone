import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String senderID;
  String receiverID;
  String type;
  String message;
  Timestamp timestamp;
  String photoUrl;

  Message({
    this.senderID,
    this.receiverID,
    this.type,
    this.message,
    this.timestamp,
    this.photoUrl,
  });

  Message.imageMessage({
    this.senderID,
    this.receiverID,
    this.type,
    this.message,
    this.timestamp,
    this.photoUrl,
  });

  Map toMap() {
    var map = Map<String, dynamic>();
    map['senderID'] = this.senderID;
    map['receiverID'] = this.receiverID;
    map['type'] = this.type;
    map['message'] = this.message;
    map['timestamp'] = this.timestamp;
    return map;
  }

  Map toImageMap() {
    var map = Map<String, dynamic>();
    map['senderID'] = this.senderID;
    map['receiverID'] = this.receiverID;
    map['type'] = this.type;
    map['message'] = this.message;
    map['timestamp'] = this.timestamp;
    map['photoUrl'] = this.photoUrl;
    return map;
  }

  Message.fromMap(Map<String, dynamic> map) {
    this.receiverID = map['receiverID'];
    this.senderID = map['senderID'];
    this.type = map['type'];
    this.message = map['message'];
    this.timestamp = map['timestamp'];
    this.photoUrl = map['photoUrl'];
  }
}
