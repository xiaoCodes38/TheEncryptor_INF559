import 'package:encrypt/encrypt.dart' as encrypt;

/// A class for AES encryption and decryption operations.
class AESEncryption {
  /// AES encryption key with a length of 32 bytes.
  static final key = encrypt.Key.fromLength(32);

  /// Initialization vector (IV) for AES encryption with a length of 16 bytes.
  static final iv = encrypt.IV.fromLength(16);

  /// Encrypter object for AES encryption.
  static final encrypter = encrypt.Encrypter(encrypt.AES(key));

  /// Encrypts the given [text] using AES encryption with the initialized IV.
  encryptMsg(String text) => encrypter.encrypt(text, iv: iv);

  /// Decrypts the given [text] using AES encryption with the initialized IV.
  decryptMsg(encrypt.Encrypted text) => encrypter.decrypt(text, iv: iv);

  /// Creates an Encrypted object from the provided [encoded] base16 encoded string.
  getCode(String encoded) => encrypt.Encrypted.fromBase16(encoded);
}
