import 'package:mysql1/mysql1.dart';

class DB {
  //Variable
  /*
  int _idProduit;
  String _nomProduit;
  String _typeProduit;
  int _prixProduit;
  int _quaniteProduit;
  */
  //TODO: Create database and change the settings depending on the new DB that will be created.
  static ConnectionSettings settings = ConnectionSettings(
    host: 'localhost',
    port: 3306,
    user: 'user',
    password: 'password',
    db: 'db',
  );

  //Builder
  /*DB(this._idProduit, this._nomProduit, this._typeProduit, this._prixProduit,
      this._quaniteProduit);

  //Set and Get
  void setIdProduit(int newID) {
    _idProduit = newID;
  }

  int getIdProduit() {
    return _idProduit;
  }

  void setNomProduit(String newName) {
    _nomProduit = newName;
  }

  String getNomProduit() {
    return _nomProduit;
  }

  void setTypeProduit(String newType) {
    _typeProduit = newType;
  }

  String getTypeProduit() {
    return _typeProduit;
  }

  void setPrixProduit(int newPrix) {
    _prixProduit = newPrix;
  }

  int getPrixProduit() {
    return _prixProduit;
  }

  void setQuantiteProduit(int newQuantite) {
    _quaniteProduit = newQuantite;
  }

  int getQuantiteProduit() {
    return _quaniteProduit;
  }
*/

  //Function
  static void chercherproduit(String lookup, String valeur) async {
    try {
      MySqlConnection connexion = await MySqlConnection.connect(settings);
      String request = 'SELECT * FROM Produits WHERE $lookup = $valeur';
      try {
        connexion.query(request);
      } catch (e) {
        print(e.toString());
      }
      connexion.close();
    } catch (e) {
      print(e.toString());
    }
  }

  static void creerproduit(int id, String nom, String type, int prix,
      int nbproduit, int idauteur, int idediteur) async {
    //NOTE TO SELF: use INSERT INTO table VALUES ('valeur 1', 'valeur 2', ...) to add a new product to database.
    try {
      MySqlConnection connexion = await MySqlConnection.connect(settings);
      String request =
          'INSERT INTO produits VALUES ($id, $nom, $type, $prix, $nbproduit, $idauteur, $idediteur)';
      try {
        connexion.query(request);
      } catch (e) {
        print(e.toString());
      }
      connexion.close();
    } catch (e) {
      print(e.toString());
    }
  }

  supprimmerproduit() {}
  modifierproduit() {}
}
