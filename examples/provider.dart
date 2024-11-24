import 'package:flutter_riverpod/flutter_riverpod.dart';

class User {
  User({required this.firstName, required this.lastName});
  final String firstName;
  final String lastName;
}

final intProvider = Provider<int>((ref) => 1);

final stringProvider = Provider<String>((ref) => 'String');

final classProvider = Provider<User>(
  (ref) => User(firstName: 'User', lastName: 'User'),
);
