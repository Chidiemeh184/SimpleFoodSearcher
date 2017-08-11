//
//  WebViewController.swift
//  SimpleFoodSearcher
//
//  Created by Chidi Emeh on 8/10/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    //UI Properties
    @IBOutlet weak var recipeWebView: UIWebView!
    
    //Class Properties
    var urlString : String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: urlString!) {
            let requestObj = URLRequest(url: url)
            recipeWebView.loadRequest(requestObj)
        }
    }


}
