//
//  ViewController.swift
//  Controls Practis
//
//  Created by Алексей Пасынков on 25.10.2020.
//

import UIKit

class ViewController: UIViewController {
    
    var number = 128{
        didSet{
            number = (number + 256) % 256
            updateUI()
        }
    }



    @IBOutlet weak var button: UIButton!
    @IBOutlet var switches: [UISwitch]!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rotetSwitches()
        updateUI()
    }
    
    /// Updates number for the switches
    func updateNumberFromSwitches()  {
        var number = 0
        for swit in switches{
            number += swit.isOn ? swit.tag : 0
        }
        self.number = number
    }
    
    
    /// Updetes switches from the number
    func updateSwithes()  {
        for swit in switches{
        swit.isOn = Int(number) & swit.tag != 0
        }
    }
    
    
    /// Updates all outlets to number
    func updateUI()  {
        button.setTitle("\(number)", for: [])
        updateSwithes()
        slider.value = Float(number)
        textField.text = "\(number)"
    
    }
    
    func rotetSwitches()  {
        for swit in switches{
            swit.layer.transform = CATransform3DMakeRotation(-.pi / 2, 0, 0, 1)
        }
    }
    
    
    @IBAction func buttonPressed() {
        number += 1
    }
    
    @IBAction func switchToggel(_ sender: UISwitch) {
        updateNumberFromSwitches()
    }
    @IBAction func sliderMove() {
        number = Int(slider.value)
    }
    
    @IBAction func textFieldEdided() {
        number = Int(textField.text ?? "") ?? 0
    }
    
    @IBAction func screenTapped(_ sender: UITapGestureRecognizer) {
        let position = sender.location(in: view)
        if position.y > view.bounds.midY {
            if position.x < view.bounds.midX{
                number -= 1
            }else{
                number += 1
            }
        }
        
    }
}

