import 'package:mysql1/mysql1.dart';
import 'session.dart';
import 'dart:io';

class DB {
  //container pour la session
  static late Session _masession;

  //envoyer une requete sur la db de la session renvoie un objet Results
  static Future<Results> chercherproduit(String critere, String valeur) async {
    return DB._masession.querry("SELECT IDProduit,NomProduit,TypeProduit,PrixProduit,QuantiteProduit,NomEditeur,AdresseEditeur FROM Produits , Editeurs  WHERE $critere = $valeur AND Produits.IDEditeur = Editeurs.IDEditeur;");
  }

  //entre un produit da la table de la session
  //les Strings et sont changé en entiers dans la requete pour faciliter l'utilisation
  static void creerproduit(String nom, String type, String prix,
      String nbproduit, String idauteur, String nomEditeur, String adresseEditeur) async {
    // ${int.parse(idauteur)}
    int? idedi = Db._masession.querry("SELECT IDEditeur FROM Editeurs where NomEditeur = $nomEditeur AND AdresseEditeur = $adresseEditeur");
    if(idedi == null){
      DB._masession.querry("INSERT INTO Editeurs (NomEditeur,AdresseEditeur) VALUES ($nomEditeur, $adresseEditeur);");
      idedi = Db._masession.querry("SELECT IDEditeur FROM Editeurs where NomEditeur = $nomEditeur AND AdresseEditeur = $adresseEditeur");
    }
    DB._masession.querry('INSERT INTO Produits (NomProduit,TypeProduit,PrixProduit,QuantiteProduit,IDEditeur) VALUES ($nom, $type, ${int.parse(prix)}, ${int.parse(nbproduit)},$idedi)');
  }

  //supprimer un produit par son id
  //utiliser la requete : DELETE FROM `utilisateur` WHERE `id` = 1
  static supprimmerproduit(int id) async {
    DB._masession.querry("DELETE FROM `Produits` WHERE `id` = $id");
  }

  //modifier un produit
  static modifierproduit(int id, String critere, String valeur) async {}

  static Future<void> modifierproduit(int id,String nom, String type, String prix,
    String nbproduit, String idauteur, String nomEditeur, String adresseEditeur) async {
    try {
      DB._masession.query("UPDATE Produit SET NomProduit = '$nom',TypeProduit = '$type',PrixProduit = '${int.parse(prix)}', QuantiteProduit = '${int.parse(nbproduit)}'  WHERE id = '$id';");
    } catch (e) {
      log(e.toString());
    }
  }

  //initialisation de la db
  Future<void> initdb() async {
    bool checkEditeurs = false;
    bool checkAuteurs = false;
    bool checkProduits = false;
    bool checkEcrire = false;
    try {
    Results reponse = await _masession.query("SHOW TABLES;");
    for (var rows in reponse) {
        for (var fields in rows) {
            if (fields.toString() == "Editeurs") {
                checkEditeurs = true;
            }
            if (fields.toString() == "Auteurs") {
                checkAuteurs = true;
            }
            if (fields.toString() == "Produits") {
                checkProduits = true;
            }
            if (fields.toString() == "Ecrire") {
                checkEcrire = true;
            }
        }
    }
    if (!checkediteurs) {
        await _masession.querry('create table Editeurs (IDEditeur int primary key not null auto_increment , NomEditeur varchar(30) not null , AdresseEditeur varchar(50) not null);');
    }
    if (!checkAuteurs) {
        await _masession.querry('create table Auteurs (IDAuteur int primary key not null auto_increment , NomAuteur varchar(30) not null , PrenomAuteur varchar(30) not null);');
    }
    if (!checkProduits) {
        await _masession.querry('create table Produits (IDProduit int primary key not null auto_increment , NomProduit varchar(30) not null , TypeProduit varchar(30) not null , PrixProduit float not null , QuantiteProduit int not null , IDEditeur int not null , foreign key (IDEditeur) references Editeurs(IDEditeur));');
    }
    if (!checkeEcrire) {
        await _masession.querry('create table Ecrire (IDAuteur int not null , IDProduit int not null , foreign key (IDAuteur) references Auteurs(IDAuteur) , foreign key (IDProduit) references Produits(IDProduit));');
    }
    } catch (e) {
        print(e.toString());
    }
  }
}
