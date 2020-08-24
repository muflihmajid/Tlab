import 'package:clean_arc_flutter/data/infrastructures/encrypter_interface.dart';
import 'package:encrypt/encrypt.dart' as AESEncryptor;

class Encrypter implements EncrypterInterface {

  
  @override
  String encrypt(String str) {
    try {
      var result = _getEncrypter().encrypt(str, iv: _getIV()).base64;
      return result;
    } catch (e) {
      return null;
    }
  }

  @override
  String decrypt(String str) {
    var target = AESEncryptor.Encrypted.fromBase64(str);
    try {
      var result = _getEncrypter().decrypt(target, iv: _getIV());
      return result.toString();
    } catch (e) {
      return null;
    }
  }

  AESEncryptor.Encrypter _getEncrypter() {
    final key = this._getKey();
    final encrypter = AESEncryptor.Encrypter(AESEncryptor.AES(key));
    return encrypter;
  }

  AESEncryptor.Key _getKey() {
    return AESEncryptor.Key.fromUtf8("UTRDjbZO8vD6UwjNPQXsPusN2l7w3hXV");
  }

  AESEncryptor.IV _getIV() {
    return AESEncryptor.IV.fromLength(16);
  }
}