//
//  ResultsViewController.swift
//  Quiz
//
//  Created by Denis Voropanov on 23.07.2022.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var markLabel: UILabel!
    @IBOutlet weak var keyMarkLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    let answers: [Answer]!
    init?(coder: NSCoder, _ answers: [Answer]){
        self.answers = answers
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func calculatePersResult() {
        let frequencyOfAnswers = answers.reduce(into: [:]) { counts,answer in
            counts[answer.type] = (counts[answer.type] ?? 0) + 1
        }
        let frequencyOfAnswersSorted = frequencyOfAnswers.sorted { pair1, pair2 in
            pair1.value > pair2.value
        }
        let mostCommonAnswer = frequencyOfAnswersSorted.first!.key
        updateUI(mostCommonAnswer)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculatePersResult()
        navigationItem.hidesBackButton = true
    }
    
    func updateUI(_ mark: MarkType){
        markLabel.text = "\(mark.rawValue)!"
        keyMarkLabel.text = mark.definition
        
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.YYYY"
        timeLabel.text = "Дата сдачи: \(formatter.string(from: currentDate))"
        
        switch mark {
        case .five:
            view.backgroundColor = .green
        case .four:
            view.backgroundColor = .cyan
        case .three:
            view.backgroundColor = .yellow
        case .two:
            view.backgroundColor = .red
        }
    }
}
