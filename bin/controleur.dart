import 'vue.dart';
import 'modele.dart';

main(List<String> args) {
  /*int choix = 0;
  while (choix != 3) {
    choix = Vue.demanderaction();
    switch (choix) {
      //si rechercher
      case 1:
        String critere = Vue.demandercritere();
        String valeur = Vue.demandervaleur();
        DB.chercherproduit(critere, valeur);
        break;
      //si modifier
      case 2:
        break;
    }
  }*/
  DB.chercherproduit("one", "two");
}
