import 'package:mysql1/mysql1.dart';

class Session {
  //on garde les identifiants saisi au lancement

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
  //puis on s'en sert pour se connecter a la db et lancer une requete

  //fonctions
  Future<Results> querryfurret(String request) async {
    dynamic reponse;
    try {
      MySqlConnection connexion = await MySqlConnection.connect(this._settings);
      try {
        reponse = connexion.query(request);
      } catch (e) {
        print(e.toString());
      }
    } catch (e) {
      print(e.toString());
    }
    return reponse;
  }
}
