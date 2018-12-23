import 'dart:async';

abstract class PushlinkStorage {
  Future<bool> usernameExists();
  Future<bool> saveUsername(String username);
}
