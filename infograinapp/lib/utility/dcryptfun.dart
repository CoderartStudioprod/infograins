import 'dart:convert';
import 'dart:developer';

import 'package:encrypt/encrypt.dart';

String decryptResponse(String encryptedText) {
  final key = Key.fromUtf8("xlhF31NeOlibJcoOW9tvZg7TkHcAZI3a");
  final iv = IV.fromUtf8("qwertyuiopasdfgh");
  final encrypter = Encrypter(AES(key, mode: AESMode.cbc));

  // Decode the base64 encoded encrypted text
  final encryptedBytes = base64.decode(encryptedText);

  // Decrypt the encrypted bytes
  final decryptedBytes =
      encrypter.decryptBytes(Encrypted(encryptedBytes), iv: iv);

  // Convert the decrypted bytes to a string
  final decryptedText = utf8.decode(decryptedBytes);
  log(decryptedText.toString());
  return decryptedText;
}
