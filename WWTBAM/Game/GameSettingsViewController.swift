//
//  GameSettingsViewController.swift
//  WWTBAM
//
//  Created by Дамир Доронкин on 23.08.2021.
//

import UIKit

class GameSettingsViewController: UIViewController {
    @IBOutlet weak var questionsOrderSC: UISegmentedControl!
    @IBAction func saveSettingsButton(_ sender: Any) {
        selectedQuestionsOrder()
    }
    
    private func selectedQuestionsOrder() {
        switch questionsOrderSC.selectedSegmentIndex {
        case 0:
            GameSingleton.instance.isDirectQuestionsOrder = true
        case 1:
            GameSingleton.instance.isDirectQuestionsOrder = false
        default:
            GameSingleton.instance.isDirectQuestionsOrder = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if GameSingleton.instance.isDirectQuestionsOrder == false {
            questionsOrderSC.selectedSegmentIndex = 1
        }
        // Do any additional setup after loading the view.
    }
}
