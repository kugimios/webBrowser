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
    
    
    @IBOutlet weak var webkitViewOutlet: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView(frame: webkitViewOutlet.bounds, configuration: WKWebViewConfiguration())
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.webkitViewOutlet.addSubview(webView)
        self.webView.allowsBackForwardNavigationGestures = true
        
        let myURL = URL(string: "https://www.google.com/")
        // let myURL = Bundle.main.url(forResource: "index", withExtension: "html")
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
