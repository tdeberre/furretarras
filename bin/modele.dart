import 'package:mysql1/mysql1.dart';

class DB {
  //attributs
  late Session masession;
  //constructeur
  DB(Session this.masession)
  //Fonctions
  Results chercherproduit(String critere, String valeur) async {
    return this.masession.querryfurret('SELECT * FROM Produits WHERE $critere = $valeur');
  }

//les arguments sont maintenant des Strings et sont changé en entiers dans la requete pour faciliter le traitement par le modele
  Results creerproduit(String nom, String type, String prix, String nbproduit, String idauteur, String idediteur) async {
    String request = 'INSERT INTO produits VALUES ($nom, $type, ${int.parse(prix)}, ${int.parse(nbproduit)},${int.parse(idediteur)} )';
    // ${int.parse(idauteur)}
    return this.masession.querryfurret(request);
  }

  //supprimer un produit par son id
  //utiliser la requete : DELETE FROM `utilisateur` WHERE `id` = 1
  static supprimmerproduit(int id) async {}
  
  //modifier un produit
  static modifierproduit(int id, String critere, String valeur) async {}
}
