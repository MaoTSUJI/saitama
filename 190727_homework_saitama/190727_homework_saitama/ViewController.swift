//
//  ViewController.swift
//  190727_homework_saitama
//
//  Created by 辻真緒 on 2019/07/27.
//  Copyright © 2019 辻真緒. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var prefectures:[String] = ["aichi", "akita", "aomori", "chiba", "ehime", "fukui", "fukuoka", "fukushima", "gifu", "gunma", "hiroshima", "hokkaidou", "hyougo", "ibaraki", "ishikawa", "iwate", "kagawa", "kagoshima", "kanagawa", "kouchi", "kumamoto", "kyouto", "mie", "miyagi", "miyazaki", "nagano", "nagasaki", "nara", "niigata", "okayama", "okinawa", "ooita", "osaka", "saga", "saitama", "shiga", "shimane", "shizuoka", "tochigi", "tokushima", "tokyo", "tottori", "toyama", "wakayama", "yamagata", "yamaguchi", "yamanashi"
    ]

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func didClickStart(_ sender: UIButton) {
        prefectures = prefectures.shuffled()
        performSegue(withIdentifier: "toNext", sender: prefectures)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNext" {
            // 次の画面のControllerを取得
            let nextVC = segue.destination as! NextViewController
            // 取得したControllerの変数valueに送信する値を設定する
            nextVC.images = sender as! [String]
        }
    }
    
}

