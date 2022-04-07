import 'package:mysql1/mysql1.dart';
import 'session.dart';
import 'dart:io';

class DB {
  //container pour la session
  static late Session masession;

  //envoyer une requete sur la db de la session renvoie un objet Results
  static Future<Results> chercherproduit(String critere, String valeur) async {
    return DB.masession
        .querry('SELECT * FROM Produits WHERE $critere = $valeur');
  }

  //entre un produit da la table de la session
  //les arguments sont des Strings et sont changé en entiers dans la requete pour faciliter l'utilisation
  static void creerproduit(String nom, String type, String prix,String nbproduit, String idauteur, String idediteur) async {
    // ${int.parse(idauteur)}
    DB.masession.querry('INSERT INTO produits VALUES ($nom, $type, ${int.parse(prix)}, ${int.parse(nbproduit)},${int.parse(idediteur)} )');
  }

  //supprimer un produit par son id
  //utiliser la requete : DELETE FROM `utilisateur` WHERE `id` = 1
  static supprimmerproduit(int id) async {
    DB.masession.querry("DELETE FROM `utilisateur` WHERE `id` = $id")
  }

  //modifier un produit
  static modifierproduit(int id, String critere, String valeur) async {}

  static initdb() async {
    ProcessResult result = await Process.run('bash', ['-c', ". createDB.sh"]);
  }
}
