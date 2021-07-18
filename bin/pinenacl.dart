import 'dart:io';
import 'dart:typed_data';

import 'package:pinenacl/src/authenticated_encryption/secret.dart' as pinenacl;

void main(List<String> args) {
  final key = Uint8List.fromList(List.generate(32, (index) => 0));
  final nonce = Uint8List.fromList(List.generate(24, (index) => 0));

  final inputBytes = File('input.txt').readAsBytesSync();

  final box = pinenacl.SecretBox(Uint8List.fromList(key));

  final encrypted = box.encrypt(
    inputBytes,
    nonce: Uint8List.fromList(
      nonce,
    ),
  );

  File('output/pinenacl.enc').writeAsBytesSync(encrypted.cipherText);
}
