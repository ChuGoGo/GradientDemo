//
//  ResultViewController.swift
//  GradientDemo
//
//  Created by Chu Go-Go on 2022/3/30.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var pokeImageView: UIImageView!
//    裝漸層的CAGradientLayer()
    var resultgradientLayer = CAGradientLayer()
//    宣告裝結果的struct
    var resultInfo: resultgradientLayerInfo!
    override func viewDidLoad() {
//        建立一個view來裝圖片
        let resultview = UIView(frame: CGRect(x: 0, y: 0, width: 352, height: 504))
//        圖片的漸層跟上一頁設定的一樣
        resultgradientLayer.colors = resultInfo.ResultColor
        resultgradientLayer.frame = CGRect(x: 110, y: 300, width: 210, height: 300)
//        漸層方式也一樣
        resultgradientLayer.startPoint = resultInfo.resultStarPoint
        resultgradientLayer.endPoint = resultInfo.resultEndpoint
//        漸層加入到resultview裡
        resultview.layer.addSublayer(resultgradientLayer)
//        圖片加入到resultview裡
        resultview.addSubview(pokeImageView)
//   resultview加入到view裡面
        view.addSubview(resultview)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
