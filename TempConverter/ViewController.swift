//
//  ViewController.swift
//  TempConverter
//
//  Created by David Svensson on 2019-01-17.
//  Copyright © 2019 David Svensson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var celsiusPicker: UIPickerView!
    
    private let converter = CelsiusConverter()
    
    private var temperatureValues = (-100...100).map{$0} //[Int]()
    private let userDefaultsRowKey = "defaultPickerRow"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let defaultPickerRow = temperatureValues.count / 2
        
        let defaultPickerRow  = initialPickerRow()
        celsiusPicker.selectRow(defaultPickerRow, inComponent: 0, animated: false)
        pickerView(celsiusPicker, didSelectRow: defaultPickerRow, inComponent: 0)
        
        
//        for index in -100...100 {
//            temperatureValues.append(index)
//        }
    }
    
    
    func initialPickerRow() -> Int {
        let savedRow = UserDefaults.standard.object(forKey: userDefaultsRowKey) as? Int
        
        if let row = savedRow {
            return row
        } else {
            return celsiusPicker.numberOfRows(inComponent: 0) / 2
        }
    }
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return temperatureValues.count
        
//        print( component)
//        if component == 0 {
//            return 3
//        }
//        else  {
//            return 5
//        }
//
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let celsiusValue = temperatureValues[row]
        
        return "\(celsiusValue)ºC"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        displayConvertedTemperatureFor(row: row)
        saveSelected(row: row)
        
    }
    
    func displayConvertedTemperatureFor(row: Int) {
        let degreeC = temperatureValues[row]
        
        temperatureLabel.text = "\(converter.degreesFahrenheit(degreesCelsius: degreeC))ºF"
        
    }
    
    func saveSelected(row: Int) {
        let defaults = UserDefaults.standard
        defaults.set(row, forKey: userDefaultsRowKey)
        defaults.synchronize()
    }
    

}

