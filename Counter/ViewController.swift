//
//  ViewController.swift
//  Counter
//
//  Created by Николай Жирнов on 13.09.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak private var counterLabel: UILabel!
    @IBOutlet weak private var plusButton: UIButton!
    @IBOutlet weak private var minusButton: UIButton!
    @IBOutlet weak private var historyChangeTextView: UITextView!
    private var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyChangeTextView.isEditable = false
    }
    
    @IBAction private func plusCounter(_ sender: Any) {
        historyChangeTextView.text += "\n \(currentDate()): значение изменено на +1"
        counter += 1
        guard let pref = counterLabel.text?.prefix(19) else {
            return
        }
        counterLabel.text = pref + String(counter)
    }
    
    @IBAction private func minusCounter(_ sender: Any) {
        if counter == 0 {
            historyChangeTextView.text += "\n \(currentDate()): попытка уменьшить значение счётчика ниже 0"
            return
        }
        else {
            historyChangeTextView.text += "\n \(currentDate()): значение изменено на -1"
            counter -= 1
            guard let pref = counterLabel.text?.prefix(19) else {
                return
            }
            counterLabel.text = pref + String(counter)
        }
    }
    
    
    @IBAction private func zeroingOut(_ sender: Any) {
        historyChangeTextView.text += "\n \(currentDate()): значение сброшено"
        counter = 0
        guard let pref = counterLabel.text?.prefix(19) else {
            return
        }
        
        counterLabel.text = pref + String(counter)
    }
    
    private func currentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "[dd.MM.yy hh:mm:ss]"
        return dateFormatter.string(from: Date())
    }
    
}

