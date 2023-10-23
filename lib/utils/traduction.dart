import 'package:get/get.dart';

class Traduction extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'titre1': 'Suivez vos colis partout dans le monde\n',
          'titre2': 'Votre meilleur partenaire',
          'recherche': 'Search',
          'erreur_serveur': 'Une erreur est survenu, le code non valide',
          'c2': 'Clothes',
          'c3': 'Eating',
          'c4': 'Furniture',
          'c5': 'Decoration',
          'c6': 'Others',
        },
        'fr_FR': {
          'titre1': 'Suivez vos colis partout dans le monde\n',
          'titre2': 'Votre meilleur partenaire',
          'recherche': 'Recherche',
          'erreur_serveur': 'Une erreur est survenu, le code non valide',
          'c2': 'Vetements',
          'c3': 'Alimentaire',
          'c4': 'Mobilier',
          'c5': 'Décoration',
          'c6': 'Autres',
        }
      };
}
