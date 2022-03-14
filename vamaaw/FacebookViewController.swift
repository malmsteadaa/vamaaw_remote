//
//  FacebookViewController.swift
//  vamaaw
//
//  Created by admin on 3/13/22.
//

import UIKit
import WebKit

class FacebookViewController: UIViewController, WKUIDelegate {
    @IBOutlet var webView: WKWebView!
    override func loadView(){
        let webConfiguration = WKWebViewConfiguration()
             webView = WKWebView(frame: .zero, configuration: webConfiguration)
             webView.uiDelegate = self
             view = webView
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let TheUrl = URL(string:"https://www.facebook.com")
        let request = URLRequest(url: TheUrl!)
        webView.load(request)
    }
    
}
