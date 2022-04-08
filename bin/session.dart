import 'package:mysql1/mysql1.dart';

class Session {
  //on garde les identifiants saisi au lancement

  //attributs
  ConnectionSettings _settings;
  //constructeur
  Session(database, user, password) {
    _settings = ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: '$user',
      password: '$password',
      db: '$database',
    );
  }
  //puis on s'en sert pour se connecter a la db et lancer une requete

  //fonctions
  Future<Results> querry(String request) async {
    dynamic reponse;
    try {
      MySqlConnection connexion = await MySqlConnection.connect(_settings);
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
