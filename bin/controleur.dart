import 'vue.dart';
import 'modele.dart';

main(List<String> args) {
  DB.initdb();
  int choix = 0;
  while (choix != 5) {
    //demande quelle action realiser
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
        int id = Vue.demanderid();
        String critere = Vue.demandercritere();
        String valeur = Vue.demandervaleur();
        DB.modifierproduit(id, critere, valeur);
        break;
      //si ajouter
      case 3:
        List<String>.generate(5, (index) => Vue.demanderproduit()[index]);
        //DB.creerproduit() ;
        break;
      //si supprimer
      case 4:
        DB.supprimmerproduit(Vue.demanderid());
        break;
    }
  }
}
