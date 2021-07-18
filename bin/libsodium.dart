import 'dart:io';
import 'dart:typed_data';
import 'dart:ffi';

import 'package:sodium/sodium.dart';

void main(List<String> args) async {
  final key = Uint8List.fromList(List.generate(32, (index) => 0));
  final nonce = Uint8List.fromList(List.generate(24, (index) => 0));

  final inputBytes = File('input.txt').readAsBytesSync();

  // load the dynamic library into dart (see https://pub.dev/packages/sodium#vm---loading-the-dynamic-library)
  final libsodium = DynamicLibrary.open(
    '/usr/lib/libsodium.so',
  );

  final sodium = await SodiumInit.init(libsodium);

  final res = sodium.crypto.secretBox.easy(
      message: inputBytes, nonce: nonce, key: SecureKey.fromList(sodium, key));

  File('output/libsodium.enc').writeAsBytesSync(res);
}
