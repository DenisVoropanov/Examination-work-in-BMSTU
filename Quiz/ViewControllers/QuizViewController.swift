//
//  QuizViewController.swift
//  Quiz
//
//  Created by Denis Voropanov on 23.07.2022.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var multiplyStackView: UIStackView!
    @IBOutlet weak var singleStackView: UIStackView!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var singleButtons: [UIButton]!
    @IBOutlet var multiplySwitch: [UISwitch]!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet var multiplyLabels: [UILabel]!
    @IBOutlet weak var rangedSlider: UISlider!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        rangedSlider.maximumValue = 0.999
    }
    
    
    private var currentAnswers: [Answer] {
        currentQuestion.answer
    }
    
    private var currentQuestion: Question {
        Question.all[questionIndex]
    }
    
    
    var answersChosen = [Answer]()
    var questionIndex = 0
    
    func updateUI() {
        for stackView in [singleStackView,multiplyStackView,rangedStackView] {
            stackView?.isHidden = true
        }
        
        let totalProgress = Float(questionIndex) / Float(Question.all.count)
        
        
        navigationItem.title = "Вопрос № \(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        progressView.setProgress(totalProgress, animated: true)
        
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack()
        case .multiply:
            updateMultiplyStack()
        case .range:
            updateRangedStack()
        }
        
        func updateSingleStack(){
            singleStackView.isHidden = false
            
            for button in singleButtons {
                button.setTitle(nil, for: [])
            }
            
            for (button, answer) in zip(singleButtons, currentAnswers){
                button.setTitle(answer.text, for: [])
            }
        }
        func updateMultiplyStack(){
            multiplyStackView.isHidden = false
            
            for label in rangedLabels {
                label.text = nil
            }
            
            for (label, answer) in zip(multiplyLabels, currentAnswers){
                
                label.text = answer.text
            }
            
        }
        func updateRangedStack(){
            rangedStackView.isHidden = false
            
            for ( i , _ ) in currentAnswers.enumerated() {
                rangedLabels[i].text = currentAnswers[i].text
            }
            
        }
        
    }
    
    
    func nextQuestion() {
        
        questionIndex += 1
        if questionIndex < Question.all.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
        
    }
    
    
    
    @IBAction func singleButtonPressed(_ sender: UIButton) {
        let answers = Question.all[questionIndex].answer
        let index = sender.tag
        guard 0 <= index && index < answers.count else {
            return
        }
        
        let answer = answers[index]
        answersChosen.append(answer)
        nextQuestion()
        
    }
    
    @IBAction func multiplyButtonPressed(_ sender: Any) {
        
        
        for (index, multiSwitch) in multiplySwitch.enumerated() {
            if multiSwitch.isOn && index < currentAnswers.count {
                let answer = currentAnswers[index]
                answersChosen.append(answer)
                
            }
        }
        nextQuestion()
    }
    
    
    
    @IBAction func rangedButtonPressed(_ sender: UIButton) {
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        if index < currentAnswers.count {
            let answer = currentAnswers[index]
            answersChosen.append(answer)
        }
        nextQuestion()
    }
    
    
    @IBSegueAction func resultsSegue(_ coder: NSCoder) -> ResultsViewController? {
        return  ResultsViewController(coder: coder, answersChosen)
    }
    
}

