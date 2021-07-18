# pinenacl SecretBox bug example

The different outputs of the same encryption can be found in the `output/` directory.

I also included some hex-dumps (the `.hexyl` files) for easy diff comparison. (For example with `code --diff output/libsodium.enc.hexyl output/pinenacl.enc.hexyl`)

## How to run

### pinenacl

```
dart bin/pinenacl.dart
```

### libsodium

```
dart bin/libsodium.dart
```

### TweetNaCl

```
npm install
node index.js
```
