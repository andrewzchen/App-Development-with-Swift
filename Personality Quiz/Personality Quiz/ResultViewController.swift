//
//  ResultViewController.swift
//  Personality Quiz
//
//  Created by Andrew Chen on 7/9/19.
//  Copyright © 2019 Andrew Chen. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var responses: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateResults()
        navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }
    
    func calculateResults() {
        // since we only care about the SchoolType each response corresponds to
        // we can make a new array that only holds
        // SchoolTypes
        let responseTypes = responses.map {$0.type}
        var answerFreq: [SchoolType : Int] = [:]
        for r in responseTypes {
            var newCount = 1
            // check if the type is in map with iflet
            if let count = answerFreq[r] {
                newCount = count + 1
            }
            answerFreq[r] = newCount
        }
        // find highest freq in map
        // sort the map with a basic greater than comparator
        let mostResponses = answerFreq.sorted(by:
        { (pair1, pair2) -> Bool in
            return pair1.value > pair2.value
        })
        let highestFreqType = mostResponses.first!.key
        resultTypeLabel.text = "Your USC School is \(highestFreqType)!"
        resultDescriptionLabel.text = highestFreqType.description
    }
    
    @IBOutlet var resultTypeLabel: UILabel!
    
    @IBOutlet var resultDescriptionLabel: UILabel!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
