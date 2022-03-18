import 'package:mysql1/mysql1.dart';

class DB {
  //Variable
  int _idProduit;
  String _nomProduit;
  String _typeProduit;
  int _prixProduit;
  int _quaniteProduit;
  //TODO: Create database and change the settings depending on the new DB that will be created.
  ConnectionSettings settings = ConnectionSettings(
    host: 'localhost',
    port: 3306,
    user: 'user',
    password: 'password',
    db: 'db',
  );

  //Builder
  DB(this._idProduit, this._nomProduit, this._typeProduit, this._prixProduit,
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

  //Function
  static chercherproduit(String lookup, String valeur) {
    String request = 'SELECT * FROM Produits WHERE $lookup = $valeur';
  }

  creerproduit() {}
  supprimmerproduit() {}
  modifierproduit() {}
}
