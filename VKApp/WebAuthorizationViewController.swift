//
//  WebAuthorizationViewController.swift
//  VKApp
//
//  Created by Julie on 19.06.2020.
//  Copyright © 2020 YuliaShlaeva. All rights reserved.
//

import UIKit
import WebKit
import Alamofire



class WebAuthorizationViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webview: WKWebView!{
        didSet {
            webview.navigationDelegate = self
        }
    }

        
        override func viewDidLoad() {
            super.viewDidLoad()

            
        var urlComponents = URLComponents()
         urlComponents.scheme = "https"
         urlComponents.host = "oauth.vk.com"
         urlComponents.path = "/authorize"
         urlComponents.queryItems = [
         URLQueryItem(name: "client_id", value: "7520974"),
         URLQueryItem(name: "display", value: "mobile"),
         URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
         URLQueryItem(name: "scope", value: "262150"),
         URLQueryItem(name: "response_type", value: "token"),
         URLQueryItem(name: "v", value: "5.110")
         ]

            let request = URLRequest(url:urlComponents.url!)
            webview.navigationDelegate = self
            webview.load(request)
                      
    }
}



extension WebAuthorizationViewController {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
                
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=")}
            .reduce ([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
         
        let token = params["access_token"] ?? ""
        let userId = params["user_id"] ?? ""
        Session.instance.token = token
        Session.instance.userId = userId

        print("token is: " + token)
        print("userID is: " + userId)
        APIMethod.method.getFriends(token: token)
        APIMethod.method.getGroups(token: token, userId: userId)
        APIMethod.method.getGroupSearch(token: token)
        APIMethod.method.getPhotos(token: token, owner_id: "568697480")
        
        performSegue(withIdentifier: "WebSignIn", sender: nil)
        decisionHandler(.cancel)
    }
}
