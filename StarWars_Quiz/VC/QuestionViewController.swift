//
//  QuestionViewController.swift
//  StarWars_Quiz
//
//  Created by Batuhan Ipci on 2022-07-25.
//

import UIKit

class QuestionViewController: UIViewController {
    
    let questions = QuestionControl.questions
    var answersChosen: [Answer] = []
    var questionIndex = 0
    
    //MARK: Outlets
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var buttonStack: UIStackView!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    
    @IBOutlet weak var switchStack: UIStackView!
    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var switch2: UISwitch!
    @IBOutlet weak var switch3: UISwitch!
    @IBOutlet weak var switch4: UISwitch!
    @IBOutlet weak var switchLbl1: UILabel!
    @IBOutlet weak var switchLbl2: UILabel!
    @IBOutlet weak var switchLbl3: UILabel!
    @IBOutlet weak var switchLbl4: UILabel!
    
    
    @IBOutlet weak var sliderStack: UIStackView!
    @IBOutlet weak var horizontalSlider: UISlider!
    @IBOutlet weak var sliderLabel1: UILabel!
    @IBOutlet weak var sliderLabel2: UILabel!

    @IBOutlet weak var questionProgressView: UIProgressView!
    
    //MARK: Next question method
    func nextQuestion() {
        questionIndex += 1
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "Results", sender: nil)
        }
    }
    
    //MARK: Single stack button type question
    @IBAction func btnTypePressed(_ sender: UIButton) {
        let answers = questions[questionIndex].answers
        
        switch sender {
        case btn1: answersChosen.append(answers[0])
        case btn2: answersChosen.append(answers[1])
        case btn3: answersChosen.append(answers[2])
        case btn4: answersChosen.append(answers[3])
        default:
            break
        }
     nextQuestion()
    }
    
  
    @IBAction func switchTypePressed() {
        let currentAnswers = questions[questionIndex].answers
        
        if switch1.isOn{
            answersChosen.append(currentAnswers[0])
        }
        if switch2.isOn{
            answersChosen.append(currentAnswers[1])
        }
        if switch3.isOn{
            answersChosen.append(currentAnswers[2])
        }
        if switch4.isOn{
            answersChosen.append(currentAnswers[3])
        }
        
        nextQuestion()
    }
    
    @IBAction func sliderTypePressed() {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(horizontalSlider.value * Float (currentAnswers.count - 1)))
        answersChosen.append(currentAnswers[index])
        
        nextQuestion()
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
        
    func updateBtnStack(using answer: [Answer]) {
        buttonStack.isHidden = false
        
        btn1.setTitle(answer[0].text, for: .normal)
        btn2.setTitle(answer[1].text, for: .normal)
        btn3.setTitle(answer[2].text, for: .normal)
        btn4.setTitle(answer[3].text, for: .normal)
    }
    
    // MARK: Multiple stack switch type question
    func updateSwitchStack (using answer: [Answer]) {
        switchStack.isHidden = false
        switch1.isOn = false
        switch2.isOn = false
        switch3.isOn = false
        switch4.isOn = false
        switchLbl1.text = answer[0].text
        switchLbl2.text = answer[1].text
        switchLbl3.text = answer[2].text
        switchLbl4.text = answer[3].text
    }
    // MARK: Range Stack type question
    func updateSliderStack(using answer: [Answer]) {
        sliderStack.isHidden = false
        horizontalSlider.setValue(0.5, animated: false)
        sliderLabel1.text = answer.first?.text
        sliderLabel2.text = answer.last?.text
        
    }
    
    // MARK: Upates Nav / progress bar / Question type
    func updateUI() {
        buttonStack.isHidden = true
        switchStack.isHidden = true
        sliderStack.isHidden = true
        let currentQuestion = questions[questionIndex]
        let currentAnswer = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Question #\(questionIndex+1)"
    
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .button_type:
            updateBtnStack(using: currentAnswer)
        case .switch_type:
            updateSwitchStack(using: currentAnswer)
        case .slider_type:
            updateSliderStack(using: currentAnswer)
            
        }
        
    }
    //MARK: Results segue presents the ResultsVC
    @IBSegueAction func showResults(_ coder: NSCoder) -> ResultsViewController? {
        return ResultsViewController(coder: coder, responses: answersChosen)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "Results" {
            let resultViewController = segue.destination as! ResultsViewController
            resultViewController.responses = answersChosen
        }
    }
    

}
 
