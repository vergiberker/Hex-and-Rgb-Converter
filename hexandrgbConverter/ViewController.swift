//
//  ViewController.swift
//  hexandrgbConverter
//
//  Created by Berker Vergi on 18.11.2020.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var redPlc: UITextField!
    
    @IBOutlet weak var bluePlc: UITextField!
    
    @IBOutlet weak var greenPlc: UITextField!
    
    @IBOutlet weak var btnConvert: UIButton!
    
    @IBOutlet weak var selectedLbl: UILabel!
    
    @IBOutlet weak var colorLBl: UILabel!
    
    var secilenIndex : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Looks for single or multiple taps.
             let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

            //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
            //tap.cancelsTouchesInView = false

            view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func segment(_ sender: UISegmentedControl) {
        
        secilenIndex = sender.selectedSegmentIndex
        selectedLbl.text?.removeAll()
        redPlc.text?.removeAll()
        bluePlc.text?.removeAll()
        greenPlc.text?.removeAll()
        colorLBl.backgroundColor = UIColor.white
        
        if secilenIndex == 0 {
            btnConvert.setTitle("Hex to Rgb", for: UIControl.State.normal)
        } else {
            btnConvert.setTitle("Rgb to Hex", for: UIControl.State.normal)
        }
        
    }
    
    
    
    @IBAction func clickedButton(_ sender: Any) {
        
        if secilenIndex == 0{
            hexToRgb()
        }else {
            rgbToHex()
            
        }
        
        
    }
    
    
    func hexToRgb() {
        
        if let redValue = UInt8(redPlc.text!){
            if let blueValue = UInt8(bluePlc.text!) {
                if let greenValue = UInt8(greenPlc.text!){
                    let redHex = String(format: "%2X", redValue)
                    let blueHex = String(format: "%2X", blueValue)
                    let greenHex = String(format: "%2X", greenValue)
                    
                    selectedLbl.text = "Hex Color : #\(redHex) \(blueHex) \(greenHex)"
                    colorLBl.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
                }
            }
        }
        
    }
    
    
    func rgbToHex() {
        
        if let redValue = UInt8(redPlc.text!, radix: 16){
            if let blueValue = UInt8(bluePlc.text!, radix: 16) {
                if let greenValue = UInt8(greenPlc.text!, radix: 16){
                    let redHex = String(format: "%2X", redValue)
                    let blueHex = String(format: "%2X", blueValue)
                    let greenHex = String(format: "%2X", greenValue)
                    
                    selectedLbl.text = "RED :\(redHex) BLUE :\(blueHex) GREEN :\(greenHex)"
                    colorLBl.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
                }
            }
        }
        
    }
    


}

