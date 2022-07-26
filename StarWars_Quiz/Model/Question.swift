//
//  Question.swift
//  StarWars_Quiz
//
//  Created by Batuhan Ipci on 2022-07-25.
//

import Foundation
import UIKit


struct Question{
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

struct Answer {
    var text: String
    var type: StarWarsCharacterType
}

enum ResponseType {
    case button_type, switch_type, slider_type
}

enum StarWarsCharacterType {
    case bobafett
    case darthvader
    case r2d2
    case jawa

    var image: UIImage {
        switch self {
            case .bobafett: return UIImage(named: "bobafett")!
            case .darthvader: return UIImage(named: "darthvader")!
            case .r2d2: return UIImage(named: "r2d2")!
            case .jawa: return UIImage(named: "jawa")!
        }
    }

    var defination: String {
        switch self {
        case .bobafett:
            return "You are Boba Fett. With his customized Mandalorian armor, deadly weaponry, Boba Fett was once regarded as one of the most fearsome and capable bounty hunters in the galaxy."
        case .darthvader:
            return "You are Darth Vader. Once a heroic Jedi Knight, Darth Vader was seduced by the dark side of the Force, became a Sith Lord, and led the Empire’s eradication of the Jedi Order. He remained in service of the Emperor"
        case .r2d2:
            return "You are R2D2, a reliable and versatile astromech droid."
        case .jawa:
            return "You are Jawa. You have physical characteristics of humanoid rodents, given the fact that your hands seem to be black and furry"
        }
    }
}


