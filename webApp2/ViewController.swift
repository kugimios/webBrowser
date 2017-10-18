//
//  ViewController.swift
//  webApp2
//
//  Created by ST13 on 16.10.2017.
//  Copyright © 2017 Kugim. All rights reserved.
//

import UIKit

var historyData = [String]()


class ViewController: UIViewController {
    @IBOutlet weak var webViewOutlet: UIView!
    @IBOutlet weak var urlTextFieldOutlet: UITextField!
    
    @IBOutlet weak var goBtnOutlet: UIButton!
    @IBAction func goBtnAction(_ sender: UIButton) {
        let urlCheck = goOrSearchURL(
                checkURL: urlTextFieldOutlet.text!,
                searchURLField: searchEngines[searchSettings.searchURL][1],
                isSearchable: searchSettings.searchIsOn
        )
        
        if urlCheck.isGoing == true {
            
            print("Gidilecek URL : \(urlCheck.url)")
            // historyData.append(urlCheck.url)
            historyData.insert(urlCheck.url, at: 0)
            urlTextFieldOutlet.text! = ""
            
        } else {
            
            // let alert = UIAlertController(title: "Title", message: "Uyari Mesaji", preferredStyle: .alert)
            let alert = UIAlertController(title: "Uyari", message: "Uzgunuz, yazdiginiz url yalnis veya arama ayarlariniz kapali.", preferredStyle: .actionSheet)
            let action1 = UIAlertAction(title: "Ayarlar'a Git", style: .default){ (_: UIAlertAction) in
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let settingsViewController = storyBoard.instantiateViewController(withIdentifier: "WebStettingsViewController")
                self.present(settingsViewController, animated: true, completion: nil)
            }
            let action2 = UIAlertAction(title: "Iptal", style: .cancel){ (_: UIAlertAction) in
                print("cancel")
            }
            alert.addAction(action1)
            alert.addAction(action2)
            self.present(alert, animated: true, completion: nil)

        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

