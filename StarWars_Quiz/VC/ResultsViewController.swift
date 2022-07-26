//
//  ResultsViewController.swift
//  StarWars_Quiz
//
//  Created by Batuhan Ipci on 2022-07-25.
//

import UIKit

class ResultsViewController: UIViewController {


    @IBOutlet weak var starwarsCharacter: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var responses: [Answer]
    
    init?(coder: NSCoder, responses:[Answer]){
        self.responses = responses
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        starwarsResult()
    }

    func starwarsResult () {
        let frequencyOfAnswers = responses.reduce(into: [StarWarsCharacterType:Int]()){(counts, answer) in
            if let existingCount = counts[answer.type]{
                counts[answer.type] = existingCount + 1
            }else{
                counts[answer.type] = 1
            }
        }
        let frequentAnswersSorted = frequencyOfAnswers.sorted(by:
        { (pair1, pair2) in
            return pair1.value > pair2.value
        })
        let mostCommonAnswer = frequentAnswersSorted.first!.key
        print(mostCommonAnswer.defination)
        starwarsCharacter.image = mostCommonAnswer.image
        descriptionLabel.text = mostCommonAnswer.defination
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
 
