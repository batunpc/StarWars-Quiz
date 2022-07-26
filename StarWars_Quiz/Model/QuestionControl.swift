//
//  QuestionControl.swift
//  StarWars_Quiz
//
//  Created by Batuhan Ipci on 2022-07-26.
//

import Foundation

//MARK: Class to monitor question types 
class QuestionControl {
    static let questions: [Question] = [
        Question(text: "What is your authority ?", type: .button_type, answers: [
            Answer(text: "Bounty Hunter", type: .bobafett),
            Answer(text: "The Lord of the Empire", type: .darthvader),
            Answer(text: "Versatile Droid for the Force", type: .r2d2),
            Answer(text: "Scavenger", type: .jawa)
            ]),
        Question (text: "Which planets have you been the most ?", type: .switch_type, answers: [
            Answer(text: "Tatooine", type: .bobafett),
            Answer(text: "Mustafar", type: .darthvader),
            Answer(text: "Arvala-7", type: .jawa),
            Answer(text: "Naboo", type: .r2d2),
            ]),
        Question(text: "How many Jedi have you killed ? ", type: .slider_type, answers: [
            Answer(text: "None", type: .r2d2),
            Answer(text: "Maybe some", type: .jawa),
            Answer(text: "Decent amount", type: .bobafett),
            Answer(text: "A lot", type: .darthvader)
            ])
    ]
}
