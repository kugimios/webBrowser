//
//  ViewController.swift
//  webApp2
//
//  Created by ST13 on 16.10.2017.
//  Copyright © 2017 Kugim. All rights reserved.
//

import UIKit
import WebKit

var historyData = [String]()


class ViewController: UIViewController, WKUIDelegate, UITabBarDelegate {
    var webView: WKWebView!
    
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
            
            // go to url
            let myURL = URL(string: urlCheck.url)
            let myRequest = URLRequest(url: myURL!)
            webView.load(myRequest)
            
  
            
            
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
    
    override func viewDidAppear(_ animated: Bool) {
        if historyURL != "" {
            urlTextFieldOutlet.text = historyURL
            goBtnAction(goBtnOutlet)
            urlTextFieldOutlet.text = historyURL
        }
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print(item.tag)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UserDefaults -> defaultURL
        if let defaultURL = UserDefaults.standard.object(forKey: "defaultURL") as? String{
            searchSettings.defaultURL = defaultURL
        }
        
        webView = WKWebView(frame: webViewOutlet.bounds, configuration: WKWebViewConfiguration())
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.webViewOutlet.addSubview(webView)
        self.webView.allowsBackForwardNavigationGestures = true
        
        
        let myURL = URL(string: searchSettings.defaultURL)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
        
        
        // default url diye bi ayarimiz olsun, boylelikle ilk
        // let myURL = Bundle.main.url(forResource: "index", withExtension: "html")
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

