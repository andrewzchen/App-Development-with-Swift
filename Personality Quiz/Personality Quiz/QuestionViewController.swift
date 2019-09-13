//
//  QuestionViewController.swift
//  Personality Quiz
//
//  Created by Andrew Chen on 7/9/19.
//  Copyright © 2019 Andrew Chen. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    var answersChosen: [Answer] = []
    var questionIndex = 0
    var questions: [Question] = [
        Question(text: "You encounter a math problem that will likely be time-consuming and difficult to solve. What do you do?", type: .single, answers: [
            Answer(text: "Buckle down and prepare to solve it.", type: .Viterbi),
            Answer(text: "Ask a friend or someone nearby for help.", type: .Marshall),
            Answer(text: "Give up.", type: .Dornsife),
            Answer(text: "Life is fleeting. Let's go to the movies.", type: .SCA)
            ]),
        Question(text: "Which activities sound fun?", type:.multiple, answers: [
            Answer(text: "Creating a new app.", type :.Viterbi),
            Answer(text: "Thinking of some ideas for a new app.", type: .Marshall),
            Answer(text: "Reading a good book.", type:.Dornsife),
            Answer(text: "Recording a short film.", type: .SCA)
            ]),
        Question(text: "You're told your classes next semester will have an average of 20 hours of homework per week. How surprised are you?", type:.ranged, answers: [
            Answer(text: "Not at all.", type :.Viterbi),
            Answer(text: "That's probably including work outside of class.", type: .Marshall),
            Answer(text: "You must have made a math error.", type:.SCA),
            Answer(text: "That can't be right!!", type: .Dornsife)
            ]),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        //first, hide all question views
        singleQStackView.isHidden = true
        multipleQStackView.isHidden = true
        rangedQStackView.isHidden = true
        
        // get current questions, answers, and progress
        let currentQ = questions[questionIndex]
        let currentAnswers = currentQ.answers
        let currProgress = Float(questionIndex) / Float(questions.count)
        
        
        // update title, question and progress
        navigationItem.title = "Question #\(questionIndex + 1)"
        questionLabel.text = currentQ.text
        qProgressView.setProgress(currProgress, animated: true)
        
        
        // reveal the correct question view
        if currentQ.type == .single {
            updateSingleStack(using: currentAnswers)
        }
        else if currentQ.type == .multiple {
            updateMultipleStack(using: currentAnswers)
        }
        else {
            updateRangedStack(using: currentAnswers)
        }
    }
    
    func updateSingleStack(using answers: [Answer])
    {
        singleQStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    func updateMultipleStack(using answers: [Answer])
    {
        multipleQStackView.isHidden = false
        multipleSwitch1.isOn = false
        multipleSwitch2.isOn = false
        multipleSwitch3.isOn = false
        multipleSwitch4.isOn = false
        
        multipleLabel1.text = answers[0].text
        multipleLabel2.text = answers[1].text
        multipleLabel3.text = answers[2].text
        multipleLabel4.text = answers[3].text
    }
    
    func updateRangedStack(using answers: [Answer])
    {
        rangedQStackView.isHidden = false
        //reset slider
        rangedSlider.setValue(0.5, animated: false)
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
        
    }
    
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var singleQStackView: UIStackView!
    @IBOutlet var singleButton1: UIButton!
    @IBOutlet var singleButton2: UIButton!
    @IBOutlet var singleButton3: UIButton!
    @IBOutlet var singleButton4: UIButton!
    
    @IBAction func singleAnswerButtonPress(_ sender: UIButton) {
        let currAnswers = questions[questionIndex].answers
        if sender == singleButton1 {
            answersChosen.append(currAnswers[0])
        }
        else if sender == singleButton2 {
            answersChosen.append(currAnswers[1])
        }
        else if sender == singleButton3 {
            answersChosen.append(currAnswers[2])
        }
        else {
            answersChosen.append(currAnswers[3])
        }
        
        // go to next question
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButtonPress(_ sender: Any) {
        let currAnswers = questions[questionIndex].answers
        if multipleSwitch1.isOn {
            answersChosen.append(currAnswers[0])
        }
        if multipleSwitch2.isOn {
            answersChosen.append(currAnswers[1])
        }
        if multipleSwitch3.isOn {
            answersChosen.append(currAnswers[2])
        }
        if multipleSwitch4.isOn {
            answersChosen.append(currAnswers[3])
        }
        
        nextQuestion()
    }
    
    @IBAction func rangedAnswerButtonPress(_ sender: Any) {
        let currAnswers = questions[questionIndex].answers
        let sliderVal = rangedSlider.value
        let answerIndex = Int(round(sliderVal * Float (currAnswers.count - 1)))
        answersChosen.append(currAnswers[answerIndex])
        
        nextQuestion()
    }
    
    func nextQuestion() {
        questionIndex += 1
        if questionIndex < questions.count {
            updateUI()
        }
        else {
            performSegue(withIdentifier: "ResultSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultSegue" {
            // pass answersChosen array to resultsViewController
            let rvc = segue.destination as! ResultViewController
            //as! casts: use as!, not as? since we know segue is 100% going to resultviewcontroller
            rvc.responses = answersChosen
        }
    }
    
    @IBOutlet var multipleQStackView: UIStackView!
    @IBOutlet var multipleLabel1: UILabel!
    @IBOutlet var multipleSwitch1: UISwitch!
    @IBOutlet var multipleLabel2: UILabel!
    @IBOutlet var multipleSwitch2: UISwitch!
    @IBOutlet var multipleLabel3: UILabel!
    @IBOutlet var multipleSwitch3: UISwitch!
    @IBOutlet var multipleLabel4: UILabel!
    @IBOutlet var multipleSwitch4: UISwitch!
    
    @IBOutlet var rangedQStackView: UIStackView!
    @IBOutlet var rangedLabel1: UILabel!
    @IBOutlet var rangedLabel2: UILabel!
    
    @IBOutlet var rangedSlider: UISlider!
    
    @IBOutlet var qProgressView: UIProgressView!
    // MARK: - Navigation
/*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
