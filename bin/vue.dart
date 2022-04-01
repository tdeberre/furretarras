import 'saisie.dart';

class Vue {
  //ecran de choix
  static int demanderaction() {
    print(
        "choisissez : \n1 . chercher un produit.\n2 . ajouter un produit\n3 . modifier un produit\n4 . supprimer un produit\n5 . quitter\n");
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
    print("entrez l'id de l'auteur :\n");
    String idauteur = Saisir.text();
    print("entrez l'id de l'editeur :\n");
    String idediteur = Saisir.text();
    return [nom, type, prix, quantite, idauteur, idediteur];
  }
}
