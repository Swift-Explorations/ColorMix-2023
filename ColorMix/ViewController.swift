//
//  ViewController.swift
//  ColorMix
//
//  Created by Brian Foutty on 1/19/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var blueSwitch: UISwitch!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    
    // MARK: - Instance Properties
    
    
    // MARK: - VDL
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.borderWidth = 5
        colorView.layer.cornerRadius = 20
        colorView.layer.borderColor = UIColor.black.cgColor
        
        updateColor()
        colorView.backgroundColor = .systemGray
        updateControls()
    }
    
    // MARK: - IB Actions
    @IBAction func switchStateChanged(_ sender: UISwitch) {
        updateColor()
        updateControls()

    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        updateColor()
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        reset()
    }
    
    
    
    // MARK: - Instance Methods
    func updateColor() {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        
        if redSwitch.isOn {
            red = CGFloat(redSlider.value)
            redLabel.text = "r = \(redSlider.value)"
        }
        if greenSwitch.isOn {
            green = CGFloat(greenSlider.value)
            greenLabel.text = "g = \(greenSlider.value)"
        }
        if blueSwitch.isOn {
            blue = CGFloat(blueSlider.value)
            blueLabel.text = "b = \(blueSlider.value)"
        }
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        colorView.backgroundColor = color
    }
    
    func reset() {
        redSwitch.isOn = false
        greenSwitch.isOn = false
        blueSwitch.isOn = false
        
        redSlider.value = 1
        greenSlider.value = 1
        blueSlider.value = 1
        
        redLabel.text = "r = 0"
        greenLabel.text = "g = 0"
        blueLabel.text = "b = 0"
        
        updateColor()
        colorView.backgroundColor = .systemGray
        updateControls()
    }
    
    func updateControls() {
        redSlider.isEnabled = redSwitch.isOn
        greenSlider.isEnabled = greenSwitch.isOn
        blueSlider.isEnabled = blueSwitch.isOn
    }


}

