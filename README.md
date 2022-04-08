Cette application permet de gerer des produits dans une base de donnees. Elle uttilise le package mysql1 (plus d'info ici : https://pub.dev/packages/mysql1).

Lors du lancement de l'application un ecran de connection apparaitra, il faut donner le nom de la base de donnee, 
il est donc nessessaire d'avoir une base de donnee prevue a cet effet, puis le nom et le mot de passe d'un utilisateur qui posede les droit sur la base de donnee pour acceder celle ci.
Une fois les information saissies l'application va verifier que les tables nessessaires sont bien presente dans la base de donnée et creer celles qui manquent.
De cela facilite la mise en place de l'application et permet de limiter les erreurs. 
Ensuite un menu s'affichera avec les differentes options disponibles: 
-Chercher un produit: Pour chercher un produit il faut donner un critere de recherche ex:NomProduit puis la valeur recherchee.
-Creer un produit: Pour creer un produit il faut saisir un nom, un type de produit, un prix, une quatite, le nom de l'editeur et son adresse.
-Modifier un produit: Pour modifier un produit il faut donner l'id du produit a modifier puis saisir les nouvelles valeurs pour le produit.
-Supprimer un produit: Pour supprimer un produit il faut saisir l'id du produit a supprimer.
-Quitter: Permet de fermer l'application.

L'application est basee sur le modele MVC on y retrouve donc les classes modele vue et controleur.
Tout l'affichage et les saisies sont geres par vue, les requetes sont envoyees par le modele, le controleur lie juste les saisies de la vue au modele.
Pour pour faciliter la comprehention les fonctions sont annotees et des outils sont mis en place pour rendre le code plus lisible. 
La vue utilise la classe Saisir pour traiter les saissies de l'utilisateur de facon bien moins encombrante via ses methodes static. ex: Saisir.int()
Le modele va envoyer des requetes sur la base de donnee en fonction des arguments qui lui sont transmis et si un retour est attendu il sera sous la forme d'un objet Results.
Ce dernier sera renvoyé a la vue par le controleur pour etre affiche.
Lors du lacement de l'application les information saisie par l'utilisateur permetent de creer un session c'est a dire un objet Session qui contiens un attribut ConnectionSettings qui permet d'acceder a la base de donnee. 
La classe Session a aussi une methode qui prend un String en argument et l'envoie a la base de donnee sous forme de requete. la session ainsi creee est transmise au modele de cette facon le modele peut envoyer les requetes nessessaires plus facilement et le code est plus lisible.

On peut aussi noter la presence d'un script qui permet de creer une base de donnee et un utilisateur. Il a servi a faciliter le developement et contiens des requetes que l'on peut retrouver dans le modele.
