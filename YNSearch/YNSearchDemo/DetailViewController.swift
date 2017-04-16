//
//  DetailViewController.swift
//  YNSearch
//
//  Created by YiSeungyoun on 2017. 4. 16..
//  Copyright © 2017년 SeungyounYi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var clickedText: String?
    
    @IBOutlet var clickedLabel: UILabel!
    
    @IBAction func closeButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        clickedLabel.text = clickedText
    }
    
    
}
