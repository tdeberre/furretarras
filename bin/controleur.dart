import 'vue.dart';
import 'modele.dart';
import 'package:mysql1/mysql1.dart';

main(List<String> args) async {
  Vue.ecranconnection();
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
        Results requete = await DB.chercherproduit(critere, valeur);
        Vue.afficherreponse(requete);
        break;
      //si modifier
      case 2:
        int id = Vue.demanderid();
        List<String> list = Vue.demanderproduit();
        DB.modifierproduit(
            id, list[0], list[1], list[2], list[3], list[4], list[5]);
        break;
      //si ajouter
      case 3:
        List<String> list = Vue.demanderproduit();
        DB.creerproduit(list[0], list[1], list[2], list[3], list[4], list[5]);
        break;
      //si supprimer
      case 4:
        DB.supprimmerproduit(Vue.demanderid());
        break;
    }
  }
}
