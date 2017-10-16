//
//  WebStettingsViewController.swift
//  webApp2
//
//  Created by ST13 on 16.10.2017.
//  Copyright © 2017 Kugim. All rights reserved.
//

import UIKit

let searchEngines = [
    ["Google", "https://www.google.com.tr/search?q="],
    ["Yandex", "https://yandex.com/search?q="],
    ["Bing", "https://bing/search?q="],
]

var searchIsOn = true
var searchURL = ""


class WebStettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var searchEnginePickerOutlet: UIPickerView!
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return searchEngines.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return searchEngines[row][0]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        searchURL = searchEngines[row][1]
        print(print(searchURL))
    }
    
    
    @IBOutlet weak var searchSettingsView: UIView!
    
    @IBOutlet weak var searchSwitchOutlet: UISwitch!

    @IBAction func searchSwitchAction(_ sender: UISwitch) {
        
        if sender.isOn == true {
            searchSettingsView.isHidden = false
            searchIsOn = true
        } else {
            searchSettingsView.isHidden = true
            searchIsOn = false
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
      
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // change default search engine
        searchEnginePickerOutlet.selectRow(2, inComponent: 0, animated: true)
        searchURL = searchEngines[2][1]
        
        // globaldeki bilgi searchSwitchOutlet'e gelsin
        searchSwitchOutlet.isOn = searchIsOn
        searchSwitchAction(searchSwitchOutlet)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    }
