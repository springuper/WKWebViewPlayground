//
//  ViewController.swift
//  WKWebViewPlayground
//
//  Created by shangchun on 2018/10/16.
//  Copyright © 2018 Chun Shang. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    @IBOutlet weak var webview: WKWebView!

    override func loadView() {
        let configuration = WKWebViewConfiguration()
        configuration.allowsInlineMediaPlayback = false
        configuration.mediaTypesRequiringUserActionForPlayback = []
        webview = WKWebView(frame: .zero, configuration: configuration)
        webview.uiDelegate = self
        webview.navigationDelegate = self
        view = webview
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // let url = URL(string: "https://web-1.staging-public.tubi.io/webview/content/428736/everybody_hates_keisha")!
        // let url = URL(string: "https://google.com")!
        // webview.load(URLRequest(url: url))
        // webview.allowsBackForwardNavigationGestures = true


        // load test.html
        let path:String = Bundle.main.path(forResource: "test", ofType: "html")!
        let textContent = try? String(contentsOfFile: path, encoding: String.Encoding.utf8)
        webview.loadHTMLString(textContent!, baseURL: nil);
    }

    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        print("prompt in ios", prompt);
        completionHandler("pong");
    }
}

