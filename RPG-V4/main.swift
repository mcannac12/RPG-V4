//
//  main.swift
//  RPG-V4
//
//  Created by Marc on 2020/11/13 maj .
//
// Le but de ce TP est de créer des classes et de les utiliser
// pour gérer un jeu de combat (RPG Role Playing Game : jeu de rôle).
// Principe du jeu :
// Deux joueurs pourront jouer.
// Au début, chaque joueur choisira la classe/type de son personnage
// - Archer avec pour arme un arc
// - Guerrier avec pour arme une épée
// - Mage avec pour arme un sceptre
// - Voleur avec pour arme deux couteaux (ajouté à l'ennoncé initial)
// Pour chaque tour, les deux joueurs vont réaliser une des 2 actions :
// - attaquer son adversaire et lui faire perdre de la vie,
// - améliorer son arme pour infliger plus de dégâts (lors d'une prochaine attaque le tour suivant).
// Le premier des 2 joueurs qui a une vie à 0 a perdu !
// Deux classes seront utilisées : Personnage et Arme.
import Foundation
// Utiliser la fonction input() pour interagir avec les utilisateurs,
// la mettre en haut de votre fichier main.swift.
// Elle permetra de demander à l'utilisateur d'entrer un nombre entier
func input() -> Int {
    if let strData = readLine() {
        if let intData = Int(strData) {
            return (intData)
        }
        else{
            print("Veuillez saisir un chiffre ! Votre saisie était : \(strData) de type : \(type(of: strData)) il y avait \(strData.count) caractères.")
            return 0
        }
    }
    // improbable mais au cas ou cela arrive :
    print("Probablement il y a eu une erreur de saisie !")
    return 0
}
func menu(numP: Int) { // afficher le menu avec les types/classes de personnage
    print("""
 Classe du personnage \(numP) :
 1. Archer
 2. Guerrier
 3. Mage
 4. Voleur
 """)
}
enum Type { case Archer, Guerrier, Mage, Voleur } // voleur ajouté à l'ennoncé initial

// Variables pour les choix des deux joueurs (type de personnage ...)
var choixP1 : Int
var choixP2 : Int

// Quel type de personnage les 2 joueurs veulent être ?
repeat {
    menu(numP: 1)
    choixP1 = input()
} while choixP1 != 1 && choixP1 != 2 && choixP1 != 3 && choixP1 != 4
print()
repeat {
    menu(numP: 2)
    choixP2 = input()
} while choixP2 != 1 && choixP2 != 2 && choixP2 != 3 && choixP1 != 4
print()

// Création des instance de classe Personnage correspondante au choix des 2 joueurs
var typeP1: Type!
switch choixP1 {
    case 1:
        typeP1 = .Archer
    case 2:
        typeP1 = .Guerrier
    case 3:
        typeP1 = .Mage
    case 4:
        typeP1 = .Voleur // ajouté à l'ennoncé initial
    default:
        break
}
var typeP2: Type!
switch choixP2 {
    case 1:
        typeP2 = .Archer
    case 2:
        typeP2 = .Guerrier
    case 3:
        typeP2 = .Mage
    case 4:
        typeP2 = .Voleur // ajouté à l'ennoncé initial
    default:
        break
}

// Création des deux personnages, grâce au constructeur, vie et arme seront initialisés
var p1 = Personnage(nom: "Personnage 1", type: typeP1)
var p2 = Personnage(nom: "Personnage 2", type: typeP2)

// Jouer tant que les deux personnages sont en vie
while p1.vie > 0 && p2.vie > 0 {
    p1.jouer(contre: p2)
    // si p2 n'est pas mort, il peut se battre
    if p2.vie > 0 {
        p2.jouer(contre: p1)
    }
}
// Chercher le vainqueur
var nomVainqueur: String
if p1.vie > 0 {
    nomVainqueur = p1.nom
} else { // c'est donc l'autre
    nomVainqueur = p2.nom
}
// Afficher le nom du vainqueur
print("Le vainqueur est " + nomVainqueur + " !")

print("Salut !")
// modifié

