//
//  NextViewController.swift
//  190727_homework_saitama
//
//  Created by 辻真緒 on 2019/07/28.
//  Copyright © 2019 辻真緒. All rights reserved.
//

import UIKit
import Koloda
import SCLAlertView

class NextViewController: UIViewController {

    @IBOutlet weak var kolodaView: KolodaView!
    @IBOutlet weak var preLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var famousLabel: UILabel!
    
    var images:[String] = [""]
    
    let prefectures = ["aichi" :"愛知県", "akita" :"秋田県", "aomori" :"青森県", "chiba" :"千葉県", "ehime" :"愛媛県", "fukui" :"福井県",    "fukuoka" :"福岡県",    "fukushima" :"福島県",    "gifu" :"岐阜県",    "gunma" :"群馬県",    "hiroshima" :"広島県",    "hokkaidou" :"北海道",    "hyougo" :"兵庫県",    "ibaraki" :"茨城県",    "ishikawa" :"石川県",    "iwate" :"岩手県",    "kagawa" :"香川県",    "kagoshima" :"鹿児島県",    "kanagawa" :"神奈川県",    "kouchi" :"高知県",    "kumamoto" :"熊本県",    "kyoto" :"京都府",    "mie" :"三重県",    "miyagi" :"宮城県",    "miyazaki" :"宮崎県",    "nagano" :"長野県",    "nagasaki" :"長崎県",    "nara" :"奈良県",    "niigata" :"新潟県",    "okayama" :"岡山県",    "okinawa" :"沖縄県",    "ooita" :"大分県",    "osaka" :"大阪府",    "saga" :"佐賀県",    "saitama" :"埼玉県",    "shiga" :"滋賀県",    "shimane" :"島根県",    "shizuoka" :"静岡県",    "tochigi" :"栃木県",    "tokushima" :"徳島県",    "tokyo" :"東京都",    "tottori" :"鳥取県",    "toyama" :"富山県",    "wakayama" :"和歌山県",    "yamagata" :"山形県",    "yamaguchi" :"山口県",    "yamanashi" :"山梨県"
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kolodaView.delegate = self
        kolodaView.dataSource = self
        
        regionLabel.textColor = .white
        famousLabel.textColor = .white

        print(images)
        
        preLabel.text = prefectures[images[0]]
    }
    
    @IBAction func didClickNext(_ sender: UIButton) {
        kolodaView.swipe(.right)
        print(images[kolodaView.currentCardIndex])
        // 都道府県表示
        preLabel.text = prefectures[images[kolodaView.currentCardIndex]]
        // 埼玉県が出たらアラート
        showAlert()
    }
    
    @IBAction func didClickBack(_ sender: UIButton) {
        kolodaView.revertAction()
    }

    // 埼玉の位置を取得
    func findSaitama()->Int {
        let num = images.index(of: "saitama")
        if let test = num {
            return test
        }
        return 0
    }
    
    // 埼玉県が出たらアラートする
    func showAlert() {
        if images[kolodaView.currentCardIndex] == "saitama" {
            // アラート画面
            let appearance = SCLAlertView.SCLAppearance(
                kTitleFont: UIFont(name: "HelveticaNeue", size: 20)!,
                kTextFont: UIFont(name: "HelveticaNeue", size: 14)!,
                kButtonFont: UIFont(name: "HelveticaNeue-Bold", size: 14)!,
                showCloseButton: false
            )

            let alert = SCLAlertView(appearance: appearance)
            // Warning
            alert.showWarning("埼玉注意報", subTitle: "さいたマラリアに感染しました")
//            SCLAlertView().showWarning("埼玉注意報", subTitle: "さいたマラリアに感染しました")
            
        }
    
    }

}

extension NextViewController: KolodaViewDelegate, KolodaViewDataSource {
    
    // 画像を生成
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {

        // 画像を生成 UIImageインスタンスを生成
        let preImage = UIImage(named: images[index])
        let bgImage = UIImage(named: "bgImage")
        print(images[index])

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
        
        // Contextに描画された画像を新しく設定
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        // Context終了
        UIGraphicsEndImageContext()
        
        // ImageViewに生成した画像を設定
        var imageView = UIImageView(image: newImage)

        // 埼玉県が出たらアラートする
        print(kolodaView.currentCardIndex, images[kolodaView.currentCardIndex])
        showAlert()
        preLabel.text = prefectures[images[kolodaView.currentCardIndex]]
        
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

