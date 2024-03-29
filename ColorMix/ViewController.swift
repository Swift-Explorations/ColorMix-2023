//
//  ViewController.swift
//  ColorMix
//
//  Created by Brian Foutty on 1/19/23.
//  #1 - add the view to Main
//  #4 - add the first switch, name it, set the attributes
//  #8 - add two more switches to the storyboard
//  #11 - add the three sliders to the storyboard
//  #19 - add a "Reset" button to the storyboard
//  #24 - tint the buttons and the sliders as shown on pages 339 to 341
// # BONUS: add a label to display each of the RGB label values
// # BONUS: add a label to display Hexadecimal value for the current ColorMix color

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    // #2 - add the colorView outlet
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var blueSwitch: UISwitch!
    // #12 - add the outlets for each slider
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    // BONUS #1 - add labels for each color in the storyboard
    // BONUs #2 - create the outlets for each label
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var hexValueLabel: UILabel!
    
    
    // MARK: - Instance Properties
    
    
    // MARK: - VDL
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // #25 - make the colorView box look nicer
        colorView.layer.borderWidth = 5
        colorView.layer.cornerRadius = 20
        colorView.layer.borderColor = UIColor.black.cgColor
        
        updateColor()
        // #3 - make the background black inside of the colorView box
        // colorView.backgroundColor = .black
        colorView.backgroundColor = .systemGray
        
        // #27 - call updatedControls()
        updateControls()
    }
    
    // MARK: - IB Actions
    // #5 - create the action for the switch
    @IBAction func switchStateChanged(_ sender: UISwitch) {
        // #6 - set the background color of the colorView box
        //colorView.backgroundColor = .red
        // #7 - update the way to add red to colorView so that it reverts to black when the switch is off
//        if sender.isOn {
//            colorView.backgroundColor = .red
//        } else {
//            colorView.backgroundColor = .black
//        }
        // #10 - comment out the code added in step #7 and call updateColor()
        updateColor()
        // #28 - call updatedControls()
        updateControls()

    }
    
    // #13 - create the action by control-dragging from the first slider
    // #14 - connect the other two sliders to this action by draggin from the gutter to the sliders on the storyboard or in the document outline
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        // #15 - call updateColor()
        updateColor()
    }
    
    // #20 - create the action by control-dragging from the Reset button
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // #22 - call the reset() function
        reset()
    }
    
    
    
    // MARK: - Instance Methods
    // #9 - create this function to updated the UI which updates the color in the colorView
    func updateColor() {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        
        if redSwitch.isOn {
            // the next line is implemented in step #9 and updated in step #16
            // red = 1
            // #16 - update the red value to use the value from the slider
            red = CGFloat(redSlider.value)
            // BONUS #3 - add the value for red slider to the red label
            redLabel.text = "Red = \(Int(redSlider.value * 255))"
        }
        if greenSwitch.isOn {
            // the next line is implemented in step #9 and updated in step #17
            // green = 1
            // #17 - update the green value to use the value from the slider
            green = CGFloat(greenSlider.value)
            // BONUS #4 - add the value for gree slider to the red label
            greenLabel.text = "Green = \(Int(greenSlider.value * 255))"
        }
        if blueSwitch.isOn {
            // the next line is implemented in step #9 and updated in step #18
            // blue = 1
            // #18 - update the blue value to use the value from the slider
            blue = CGFloat(blueSlider.value)
            // BONUS #5 - add the value for blue slider to the blue label
            blueLabel.text = "Blue = \(Int(blueSlider.value * 255))"
        }
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        colorView.backgroundColor = color
        
        // BONUS #7b - convert rgb to hexadecimal value
        let hexValue = rgbToHex(red: Int(redSlider.value * 255), green: Int(greenSlider.value * 255), blue: Int(blueSlider.value * 255))
        
        hexValueLabel.text = "\(hexValue)"

    }
    
    // #21 - create this as a blank function
    func reset() {
        // #23 - implement the reset() function to reset the values
        redSwitch.isOn = false
        greenSwitch.isOn = false
        blueSwitch.isOn = false
        
        redSlider.value = 0
        greenSlider.value = 0
        blueSlider.value = 0
        
        redLabel.text = "Red = 0"
        greenLabel.text = "Green = 0"
        blueLabel.text = "Blue = 0"
       
        
        updateColor()
        colorView.backgroundColor = .systemGray
        // #29 - call updatedControls()
        updateControls()
    }
    
    // #26 - prevent sliders from working when corresponding switch is off
    func updateControls() {
        redSlider.isEnabled = redSwitch.isOn
        greenSlider.isEnabled = greenSwitch.isOn
        blueSlider.isEnabled = blueSwitch.isOn
    }

    // #BONUS 7a - function to convert RGB to Hexadecimal
    func rgbToHex(red: Int, green: Int, blue: Int) -> String {
        let redHexValue = String(format: "%02X", red)
        let greenHexValue = String(format: "%02X", green)
        let blueHexValue = String(format: "%02X", blue)
        
        return "#\(redHexValue)\(greenHexValue)\(blueHexValue)"
    }

}

