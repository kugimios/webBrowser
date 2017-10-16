//
//  ViewController.swift
//  webApp2
//
//  Created by ST13 on 16.10.2017.
//  Copyright © 2017 Kugim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var urlTextFieldOutlet: UITextField!
    
    @IBOutlet weak var goBtnOutlet: UIButton!
    @IBAction func goBtnAction(_ sender: UIButton) {
        let url = goOrSearchURL(urlTextFieldOutlet.text!)
        print(url)
        
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

