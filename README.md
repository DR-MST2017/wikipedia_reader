Compte Rendu TP
Gestion d'État avec MVVM — HTTP — ChangeNotifier — ListenableBuilder
Application : Wikipedia Reader
________________________________________
1. Introduction
Dans ce TP, nous avons réalisé une application Flutter appelée Wikipedia Reader.
Cette application permet de récupérer et d’afficher aléatoirement un article depuis l’API de Wikipedia.
Le projet utilise l’architecture MVVM (Model – View – ViewModel) afin de séparer la logique métier, la gestion des données et l’interface utilisateur.
L'application effectue des requêtes HTTP vers l’API Wikipedia et affiche les informations suivantes :
•	Image de l’article
•	Titre
•	Description
•	Résumé
La gestion d’état est réalisée à l’aide de ChangeNotifier et ListenableBuilder, ce qui permet à l’interface de se mettre à jour automatiquement lorsque les données changent.
________________________________________
2. Objectifs du TP
Les objectifs de ce TP sont :
•	Comprendre l’architecture MVVM
•	Effectuer des requêtes HTTP asynchrones
•	Manipuler les données JSON
•	Implémenter ChangeNotifier
•	Connecter la logique métier à l’interface avec ListenableBuilder
•	Construire une application Flutter complète.
________________________________________
3. Environnement de travail
Outils utilisés :
•	Framework : Flutter
•	Langage : Dart
•	IDE : Visual Studio Code
•	Package utilisé : http
•	API utilisée : Wikipedia REST API
Commande pour créer le projet :
flutter create wikipedia_reader --empty
Ajout du package HTTP :
flutter pub add http
________________________________________
4. Architecture MVVM
L’architecture MVVM repose sur trois couches principales :
4.1 Model
Le Model gère les données et les requêtes vers l’API.
Dans ce projet :
•	ArticleModel
•	Summary
Responsabilités :
•	envoyer les requêtes HTTP
•	parser les données JSON
•	retourner les données sous forme d’objets Dart
📷 Capture d’écran :
<img width="682" height="541" alt="9" src="https://github.com/user-attachments/assets/2911e920-eae3-4df7-8cfb-71541dd7f8de" />

________________________________________
4.2 ViewModel
Le ViewModel agit comme intermédiaire entre la vue et le modèle.
Dans ce projet :
•	ArticleViewModel
Responsabilités :
•	gérer les états de l’application
•	appeler le modèle
•	notifier la vue lors d’un changement d’état
Les états possibles :
•	loading
•	success
•	error
📷 Capture d’écran :

 <img width="726" height="909" alt="image" src="https://github.com/user-attachments/assets/57571f41-e681-47ad-91d8-910672ab3145" />


4.3 View
La View correspond à l’interface graphique affichée à l’utilisateur.
Dans ce projet :
•	ArticleView
•	ArticlePage
•	ArticleWidget
Responsabilités :
•	afficher les données
•	écouter les changements du ViewModel
•	reconstruire l’interface
📷 Capture d’écran :

 <img width="769" height="796" alt="image" src="https://github.com/user-attachments/assets/dc78a4b4-bf2f-4d32-b009-04392dfed3b7" />

________________________________________
5. Implémentation de la requête HTTP
La requête HTTP est réalisée dans la classe ArticleModel.
Elle utilise le package http pour récupérer un article aléatoire depuis l’API Wikipedia.
URL utilisée :
https://en.wikipedia.org/api/rest_v1/page/random/summary
Étapes de la requête :
1.	Création de l’URL avec Uri.https()
2.	Envoi de la requête GET
3.	Vérification du code HTTP
4.	Conversion du JSON en objet Dart
📷 Capture d’écran :
 <img width="596" height="519" alt="image" src="https://github.com/user-attachments/assets/ad3b7c9a-7b43-4965-b3e7-c632d6d457a8" />

________________________________________
6. Gestion d’état avec ChangeNotifier
Le ViewModel hérite de ChangeNotifier.
Cela permet de notifier l’interface lorsque les données changent.
Méthodes utilisées :
•	notifyListeners()
•	getRandomArticleSummary()
Fonctionnement :
1.	L'utilisateur clique sur Article suivant
2.	L'état passe à loading
3.	L'application appelle l'API
4.	Les données sont récupérées
5.	L’interface est reconstruite automatiquement
📷 Capture d’écran :
 <img width="540" height="371" alt="image" src="https://github.com/user-attachments/assets/1322a32b-5fb4-4c8b-bb0e-3617b04e5179" />


________________________________________
7. Interface utilisateur
L’interface affiche :
•	l’image de l’article
•	le titre
•	la description
•	le résumé
•	un bouton pour charger un nouvel article
Widgets utilisés :
•	Scaffold
•	AppBar
•	Column
•	Image.network
•	Text
•	ElevatedButton
•	CircularProgressIndicator
📷 Capture d’écran :
 
<img width="783" height="905" alt="image" src="https://github.com/user-attachments/assets/36cfc710-ff68-424c-8cd2-a54fc30d2426" />

8. Test de l’application
L’application est lancée avec la commande :
flutter run -d chrome
Fonctionnement observé :
1.	Au démarrage un spinner de chargement apparaît.
2.	Un article Wikipedia est affiché.
3.	En cliquant sur Article suivant, un nouvel article est chargé.
4.	En cas d’absence d’internet, un message d’erreur apparaît.
📷 Capture d’écran :
 <img width="945" height="139" alt="image" src="https://github.com/user-attachments/assets/285cc9ed-a2d9-4595-9858-fbd9bccd191e" />

📷 Capture d’écran :
 
___________<img width="945" height="329" alt="image" src="https://github.com/user-attachments/assets/7182e71c-9199-40cd-bc57-3214443f533a" />
_____________________________
9. Résultat obtenu
L’application fonctionne correctement et permet de :
•	récupérer un article aléatoire
•	afficher les informations principales
•	charger de nouveaux articles
•	gérer les erreurs réseau
L’architecture MVVM permet une bonne séparation entre les différentes parties du code.
________________________________________
10. Conclusion
Ce TP nous a permis de comprendre comment construire une application Flutter structurée en utilisant l’architecture MVVM.
Nous avons également appris à :
•	effectuer des requêtes HTTP
•	gérer les données JSON
•	utiliser ChangeNotifier pour la gestion d’état
•	connecter la logique métier à l’interface avec ListenableBuilder
Cette architecture facilite la maintenance du code et rend l’application plus modulaire et évolutive.

11. Annexes
Liste des fichiers du projet :
•	main.dart
•	summary.dart
•	article_model.dart
•	article_view_model.dart
•	article_view.dart
•	article_page.dart
•	article_widget.dart
📷 Capture d’écran :
<img width="390" height="728" alt="image" src="https://github.com/user-attachments/assets/746ae639-dbed-4195-9ae6-181c1470eee8" />






 

