//
//  Personnage.swift
//  RPG-V4
//
//  Created by Marc on 2020/11/13 maj .
//
// Classe Personnage
//
// Un personnage devra pouvoir disposer d’un nom, d'un type
// (Archer, Guerrier, Mage, ...), d’une arme et d’une vie.
// Inutile de créer des classes Archer, Guerrier ou Mage,
// utilisez une énumération de Type qui représentera ces types de personnage.
// La gestion de la vie se fera sur une jauge de vie.
// Par exemple, une vie à 100 représente une jauge pleine de vie.
// Une jauge à 0 voudra dire que le personnage est mort.
// Un personnage devra aussi pouvoir jouer un tour de jeu,
// recevoir des dégâts ou en infliger à son adversaire en l’attaquant
// ou encore améliorer son arme en augmentant la capacité des dégâts de l’arme.
// Enfin, à chaque tour, vous afficherez le nom du personnage,
// sa jauge de vie et les dégâts que provoque son arme
// grâce à une méthode de la classe Personnage.
// Définir une propriété à Personnage de type Arme.
// Fournir au Personnage un objet de type Arc ou Epee ...
class Personnage {
    var nom: String
    let type: Type // type de personnage
    var arme: Arme
    var vie: Int // jauge de vie
    init(nom: String, type: Type) {
        self.nom = nom
        self.type = type
        switch self.type {
            case .Archer:
                self.arme = Arc()
                self.vie = 90
            case .Guerrier:
                self.arme = Epee()
                self.vie = 100
            case .Mage:
                self.arme = Sceptre()
                self.vie = 80
            case .Voleur: // ajouté à l'ennoncé pour améliorer
                self.arme = Couteaux()
                self.vie = 95
        }
    }
    func jouer(contre personnage: Personnage) {
        var choixUtilisateur: Int
        // caractéristiques du personnage qui doit jouer
        self.afficherNom()
        // choisir
        repeat {
            print("""
 Quel choix ?
 1. Attaquer
 2. Améliorer son arme
 """)
            choixUtilisateur = input()
            print()
        } while choixUtilisateur != 1 && choixUtilisateur != 2
        // réaliser l'action demandée
        if choixUtilisateur == 1 {
            self.attaquer(personnage: personnage)
        } else {
            self.ameliorerArme()
        }
    }
    
    func recevoir(degats: Int) {
        self.vie = self.vie - degats
        // Si vie est négative, mettre à 0 pour indiquer que le personnage est mort
        if self.vie < 0 {
            self.vie = 0
        }
    }
    func attaquer(personnage: Personnage) {
        personnage.recevoir(degats: self.arme.degats)
    }
    func ameliorerArme() {
        self.arme.degats += 5
    }
    // Afficher la afficher le nom et la vie du personnage
    func afficherNom() {
        print("""
 Nom : \(self.nom)
 Vie : \(self.vie)
 Dégâts de son arme : \(self.arme.degats)
 """)
    }
}
