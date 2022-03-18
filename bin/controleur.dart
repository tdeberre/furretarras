import 'dart:io';
import 'package:mysql1/mysql1.dart';

main(List<String> args) {
  ConnectionSettings settings = ConnectionSettings(
    host: 'localhost',
    port: 3306,
    user: 'user',
    password: 'password',
    db: 'db',
  );
}
