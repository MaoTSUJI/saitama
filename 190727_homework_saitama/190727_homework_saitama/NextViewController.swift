//
//  NextViewController.swift
//  190727_homework_saitama
//
//  Created by 辻真緒 on 2019/07/28.
//  Copyright © 2019 辻真緒. All rights reserved.
//

import UIKit
import Koloda

class NextViewController: UIViewController {

    @IBOutlet weak var kolodaView: KolodaView!
    @IBOutlet weak var preLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var famousLabel: UILabel!
    
    let images = ["aichi", "akita", "aomori", "chiba", "ehime", "fukui", "fukuoka", "fukushima", "gifu", "gunma", "hiroshima", "hokkaidou", "hyougo", "ibaraki", "ishikawa", "iwate", "kagawa", "kagoshima", "kanagawa", "kouchi", "kumamoto", "kyouto", "mie", "miyagi", "miyazaki", "nagano", "nagasaki", "nara", "niigata", "okayama", "okinawa", "ooita", "osaka", "saga", "saitama", "shiga", "shimane", "shizuoka", "tochigi", "tokushima", "tokyo", "tottori", "toyama", "wakayama", "yamagata", "yamaguchi", "yamanashi"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kolodaView.delegate = self
        kolodaView.dataSource = self
        // 現在地を確認
        
    }
    
    @IBAction func didClickNext(_ sender: UIButton) {
        kolodaView.swipe(.right)
    }
    
    @IBAction func didClickBack(_ sender: UIButton) {
        kolodaView.revertAction()
    }
    
    
}

extension NextViewController: KolodaViewDelegate, KolodaViewDataSource {

    // 画像を生成
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {

        // 画像を生成 UIImageインスタンスを生成
        let preImage = UIImage(named: images[index])
        let bgImage = UIImage(named: "bgImage")
        // 画像ネームを取得
        let text = images[index]
        // 幅　高さの生成
        let imageWidth = preImage!.size.width
        let imageHeight = preImage!.size.height
        
        // 合成後の画像のサイズを取得
        let newSize = CGSize(width: imageHeight, height: imageHeight)
        
        // UIGraphicsBeginImageContext を呼び出し
        UIGraphicsBeginImageContextWithOptions(newSize, false, bgImage!.scale)
        
        // 各画像をCGRectでレンダリング
        bgImage!.draw(in: CGRect(x:0,y:0,width:newSize.width,height:newSize.height))
        preImage!.draw(in: CGRect(x:0,y:0,width:newSize.width,height:newSize.height),blendMode:CGBlendMode.normal, alpha:1.0)
        
        // テキストの描画領域
        let textRect = CGRect(x:0,y:0, width:100, height:50)
        text.draw(in: textRect)
        
        // Contextに描画された画像を新しく設定
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        // Context終了
        UIGraphicsEndImageContext()
        
        // ImageViewに生成した画像を設定
        var imageView = UIImageView(image: newImage)

        // ImageViewを返す
        return imageView
    }
    // 何行Viewを渡すか
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return images.count
    }

    // 左右のスワイプを判定
    func koloda(_ koloda: KolodaView, allowedDirectionsForIndexindex: Int) -> [SwipeResultDirection] {
        return [.left, .right, .up, .down]
        
    }
    


}

