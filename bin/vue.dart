import 'package:mysql1/mysql1.dart';
import 'saisie.dart';
import 'modele.dart';

class Vue {
  //ecran de connection
  static ecranconnection() {
    print("\nConnection\n");
    //"furretDB" par defaut
    print("base de donnée :");
    String database = Saisir.text();
    //"dartuser" par defaut
    print("identifiant :");
    String id = Saisir.text();
    //"btsinfo" par defaut
    print("mot de passe :");
    String pass = Saisir.mdp();
    DB.setSession(database, id, pass);
  }

  //ecran de choix
  static int demanderaction() {
    print(
        "\nchoisissez : \n1 . chercher un produit.\n2 . modifier un produit\n3 . ajouter un produit\n4 . supprimer un produit\n5 . quitter\n");
    int selection = Saisir.entier();
    return selection;
  }

  //ecran si chercher
  static String demandercritere() {
    print("selon quel critere realiser la recherche :\n");
    String saisie = Saisir.text();
    return saisie;
  }

  static String demandervaleur() {
    print("entrez la valeur :\n");
    String saisie = Saisir.text();
    return saisie;
  }

  //ecran si supprimer
  static int demanderid() {
    print("entrez l'id du produit :\n");
    int saisie = Saisir.entier();
    return saisie;
  }

  //ecran si ajouter
  static demanderproduit() {
    print("entrez le nom :\n");
    String nom = Saisir.text();
    print("entrez le type :\n");
    String type = Saisir.text();
    print("entrez le prix :\n");
    String prix = Saisir.text();
    print("entrez la quatite :\n");
    String quantite = Saisir.text();
    print("entrez le nom de l'editeur :\n");
    String nomediteur = Saisir.text();
    print("entrez l'adressse de l'editeur :\n");
    String adresseediteur = Saisir.text();
    return [nom, type, prix, quantite, nomediteur, adresseediteur];
  }

  //afficher un tableau
  static afficherreponse(Results reponse) {
    for (var row in reponse) {
      for (var field in row) {
        print(field.toString());
      }
    }
  }
}
