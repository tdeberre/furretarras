import 'dart:io';

class Vue {
  //ecran de choix
  static int demanderaction() {
    print(
        "choisissez : \n 1 . chercher un produit.\n2 . modifier la base de donnée\n3 . quitter\n");
    int selection = saisirint();
    return selection;
  }

  //ecran si chercher
  static String demandercritere() {
    print("selon quel critere realiser la recherche :\n");
    String saisie = saisirString();
    return saisie;
  }

  static String demandervaleur() {
    print("entrez la valeur :\n");
    String saisie = saisirString();
    return saisie;
  }

  //ecran si supprimer
  static int demanderid() {
    print("quel est l'id du produit que vous souhaitez supprimer :\n");
    int saisie = saisirint();
    return saisie;
  }

  //ecran si ajouter
  static demanderproduit() {}

  //saisie des sentiers/strings
  static int saisirint() {
    int saisie;
    try {
      saisie = int.parse(stdin.readLineSync().toString());
    } catch (e) {
      print(e.toString());
      saisie = saisirint();
    }
    return saisie;
  }

  static String saisirString() {
    String saisie;
    try {
      saisie = stdin.readLineSync().toString();
    } catch (e) {
      print(e.toString());
      saisie = saisirString();
    }
    return saisie;
  }
}
