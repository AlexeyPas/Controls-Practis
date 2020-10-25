//
//  ViewController.swift
//  Controls Practis
//
//  Created by Алексей Пасынков on 25.10.2020.
//

import UIKit

class ViewController: UIViewController {
    
    var number: UInt8 = 128{
        didSet{
            updateUI()
        }
    }



    @IBOutlet weak var button: UIButton!
    @IBOutlet var switches: [UISwitch]!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    /// Updates all outlets to number
    func updateUI()  {
        button.setTitle("\(number)", for: [])
        
        // TODO: set switched to number
        
        
        slider.value = Float(number)
        textField.text = "\(number)"
    
    }
    
    
    @IBAction func buttonPressed() {
        number = UInt8((Int(number) + 1) % 256)
    }
    
    @IBAction func switchToggel(_ sender: UISwitch) {
    }
    @IBAction func sliderMove() {
        number = UInt8(slider.value)
    }
    
    @IBAction func textFieldEdided() {
        number = UInt8(textField.text ?? "") ?? 128
    }
}

