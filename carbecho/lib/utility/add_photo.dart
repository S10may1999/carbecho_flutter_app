import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class StoreData {
  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    Reference ref = _storage.ref().child(childName).child('id');
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> saveCarData(
      {required String carName,
      required String carModal,
      required String CarPurchaseDate,
      required Uint8List file}) async {
    String resp = "Some Error Occoured";
    try {
      String imageUrl = await uploadImageToStorage('CarImage', file);
      await _firestore.collection("CarData").add({
        'CarName': carName,
        'CarModal': carModal,
        'CarPurchaseDate': CarPurchaseDate,
        'CarImageUrl': imageUrl,
      });
      resp = "Success";
    } catch (err) {
      resp = err.toString();
    }
    return resp;
  }
}
