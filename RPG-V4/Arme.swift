//
//  Arme.swift
//  RPG-V4
//
//  Created by Marc on 2020/11/13 maj .
//
// Classe Arme
//
// Les classes Arc, Epee, Sceptre ... héritent de Arme,
// dans chaque classes préciser les dégâts que l'arme inflige.
// C’est à cause de ces dégâts que le personnage adverse perd de la vie.
class Arme {
    var degats: Int
    init(degats: Int) {
        self.degats = degats
    }
}
class Arc: Arme {
    init() {
        super.init(degats: 12)
    }
}
class Epee: Arme {
    init() {
        super.init(degats: 10)
    }
}
class Sceptre: Arme {
    init() {
        super.init(degats: 15)
    }
}
class Couteaux : Arme { // 2 Couteaux longs ajouté à l'ennoncé initial pour le voleur
    init() {
        super.init(degats: 20)
    }
}
