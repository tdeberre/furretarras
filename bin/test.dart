import 'package:mysql1/mysql1.dart';

createtable() async {
  ConnectionSettings settings = ConnectionSettings(
    host: 'localhost',
    port: 3306,
    user: 'dartuser',
    password: 'password',
    db: 'db',
  );

  try {
    MySqlConnection connexion = await MySqlConnection.connect(settings);
    String request =
        "SELECT * FROM furetdb WHERE EXISTS (SELECT * FROM produit);";
    connexion.query(request);
  } catch (e) {
    print(e.toString());
  }
}
