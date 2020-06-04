//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 01.06.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet var emojiLabel: UILabel!
    @IBOutlet var resultTextLabel: UILabel!
    
    // MARK: - Properties
    
    var answers: [Answer]!
    
    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let resultQuiz = calculatedResult()
        emojiLabel.text = "Вы - " + String(resultQuiz.rawValue)
        resultTextLabel.text = resultQuiz.definition
        
        navigationItem.hidesBackButton = true
        
    }
    
    deinit {
        print("ResultsViewController has been dealocated")
    }
    
    // MARK: - Private Methods
    
    private func calculatedResult() -> AnimalType {
        
        var results = [
            AnimalType.dog : 0,
            AnimalType.cat : 0,
            AnimalType.rabbit : 0,
            AnimalType.turtle : 0
        ]
        
        for answer in answers {
            results[answer.type]! += 1
        }
        
        let sortResults = results.sorted(by: { $0.value > $1.value })
        return sortResults.first!.key
        
    }
    
}
