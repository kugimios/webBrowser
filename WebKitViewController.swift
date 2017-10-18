//
//  WebKitViewController.swift
//  webApp2
//
//  Created by ST13 on 18.10.2017.
//  Copyright © 2017 Kugim. All rights reserved.
//

import UIKit
import WebKit


class WebKitViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    
    override func loadView() {
        
        
        // webView = WKWebView(frame: webkitViewOutlet.bounds, configuration: webConfiguration)
        // webView.uiDelegate = self
        //view = webView
    }

    @IBOutlet weak var webkitViewOutlet: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        webView = WKWebView(frame: webkitViewOutlet.bounds, configuration: WKWebViewConfiguration())
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.webkitViewOutlet.addSubview(webView)

       
        
        let myURL = URL(string: "https://www.apple.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
