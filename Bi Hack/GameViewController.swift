//
//  GameViewController.swift
//  Bi Hack
//
//  Created by Еркебулан on 13.04.2021.
//

import UIKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func link(_ sender: UIButton) {
        openUrl(urlStr: "http://nuraly7c.beget.tech")
    }
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    func openUrl(urlStr:String!) {
         if let url = NSURL(string:urlStr) {
            UIApplication.shared.openURL(url as URL)
         }
    }
        
}
