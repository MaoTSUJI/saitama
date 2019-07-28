//
//  ViewController.swift
//  190727_homework_saitama
//
//  Created by 辻真緒 on 2019/07/27.
//  Copyright © 2019 辻真緒. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didClickStart(_ sender: UIButton) {
        performSegue(withIdentifier: "toNext", sender: nil)
    }
    
}

