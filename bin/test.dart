import 'package:mysql1/mysql1.dart';

class Session {
  //attributs
  late ConnectionSettings _settings;
  //constructeur
  Session(user, password) {
    this._settings = ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: '$user',
      password: '$password',
      db: 'furetDB',
    );
  }
  querryfuret(String request) async {
    try {
      MySqlConnection connexion = await MySqlConnection.connect(this._settings);
      try {
        connexion.query(request);
      } catch (e) {
        print(e.toString());
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
