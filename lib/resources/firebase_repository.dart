/* import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:skype_clone/models/message.dart';
import 'package:skype_clone/models/user.dart';
import 'package:skype_clone/provider/image_upload_provider.dart';
import 'package:skype_clone/resources/auth_methods.dart';

import 'chat_methods.dart';

class FirebaseRepository {
  ChatMethods _chatMethods = ChatMethods();

  AuthMethods _authMethods = AuthMethods();

  Future<FirebaseUser> getCurrentUser() => _authMethods.getCurrentUser();

  Future<User> getUserDetail() => _authMethods.getUserDetail();

  Future<FirebaseUser> signIn() => _authMethods.signIn();

  Future<bool> authenticateUser(FirebaseUser user) =>
      _authMethods.authenticateUser(user);

  Future<void> addDataToDb(FirebaseUser user) =>
      _authMethods.addDataToDb(user);

  Future<void> signOut() => _authMethods.signOut();

  Future<List<User>> fetchAllUsers(FirebaseUser user) =>
      _authMethods.fetchAllUsers(user);

  Future<void> addMessageToDb(Message message, User sender, User receiver) =>
      _chatMethods.addMessageToDb(message, sender, receiver);

  void uploadImage({
    @required File image,
    @required String receiverID,
    @required String senderID,
    @required ImageUploadProvider imageUploadProvider,
  }) =>
      _chatMethods.uploadImage(
        image,
        receiverID,
        senderID,
        imageUploadProvider,
      );
}
 */