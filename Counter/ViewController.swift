//
//  ViewController.swift
//  Counter
//
//  Created by Николай Жирнов on 13.09.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelCounter: UILabel!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var buttonMinus: UIButton!
    
    @IBOutlet weak var historyChange: UITextView!
    
    
    
    
    private var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        historyChange.isEditable = false
    }
    
    @IBAction func plusCounter(_ sender: Any) {
        historyChange.text += "\n \(currentDate()): значение изменено на +1"
        counter += 1
        guard let pref = labelCounter.text?.prefix(19) else {
            return
        }
        labelCounter.text = pref + String(counter)
        
    }
    
    @IBAction func minusCounter(_ sender: Any) {
        if counter == 0 {
            historyChange.text += "\n \(currentDate()): попытка уменьшить значение счётчика ниже 0"
            return
        }
        else {
            historyChange.text += "\n \(currentDate()): значение изменено на -1"
            counter -= 1
            guard let pref = labelCounter.text?.prefix(19) else {
                return
            }
            labelCounter.text = pref + String(counter)
        }
    }
    
    
    @IBAction func zeroingOut(_ sender: Any) {
        historyChange.text += "\n \(currentDate()): значение сброшено"
        counter = 0
        guard let pref = labelCounter.text?.prefix(19) else {
            return
        }
        
        labelCounter.text = pref + String(counter)
    }
    
    func currentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "[dd.MM.yy hh:mm:ss]"
        return dateFormatter.string(from: Date())
    }
    
}

