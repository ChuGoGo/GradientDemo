//
//  ViewController.swift
//  GradientDemo
//
//  Created by Chu Go-Go on 2022/3/28.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var fristRedSlider: UISlider!
    @IBOutlet weak var fristGreenSlider: UISlider!
    @IBOutlet weak var fristBlueSlider: UISlider!
    @IBOutlet weak var fristAlphaSlider: UISlider!
    @IBOutlet weak var starXpoint: UISlider!
    @IBOutlet weak var starYpointSlider: UISlider!
    @IBOutlet weak var secRedSlider: UISlider!
    @IBOutlet weak var secGreenSlider: UISlider!
    @IBOutlet weak var secBlueSlider: UISlider!
    @IBOutlet weak var sceAlphaSlider: UISlider!
    @IBOutlet weak var fristRedLB: UILabel!
    @IBOutlet weak var firstGreenLB: UILabel!
    @IBOutlet weak var fristBlueLB: UILabel!
    @IBOutlet weak var fristAlphaLB: UILabel!
    @IBOutlet weak var firstXpointLB: UILabel!
    @IBOutlet weak var fristYpointLB: UILabel!
    @IBOutlet weak var endXpoint: UISlider!
    @IBOutlet weak var endYpoint: UISlider!
    @IBOutlet weak var redSecLB: UILabel!
    @IBOutlet weak var greenSecLB: UILabel!
    @IBOutlet weak var blueSecLB: UILabel!
    @IBOutlet weak var alphaSecLB: UILabel!
    @IBOutlet weak var endXpointLB: UILabel!
    @IBOutlet weak var endYpointLB: UILabel!
//    加入漸層的 CAGradientLayer()
    let gradientLayer = CAGradientLayer()
//    裝圖片跟漸層的View
    let gradientview = UIView(frame: CGRect(x: 82, y: 90, width: 250, height: 280))
    override func viewDidLoad() {
//        設定初始值
        starXpoint.setValue(0.5, animated: true)
        starYpointSlider.setValue(0, animated: true)
        endXpoint.setValue(0.5, animated: true)
        endYpoint.setValue(1, animated: true)
//        加入圖片
        backGroundView()
//        更新文字
        updatUI()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
//    隨機
    @IBAction func randomColor(_ sender: UIButton) {
        randomColor()
    }
//    slider都拉進來
    @IBAction func changeGradientColor(_ sender: Any) {
        changeGradient()
    }
//    重新
    @IBAction func resetButton(_ sender: UIButton) {
        reset()
    }
//    傳到下一頁
    @IBSegueAction func showResult(_ coder: NSCoder) -> ResultViewController? {
//        讓數值先跑到這邊
        changeGradient()
//        宣告下一頁的controller
        let controller = ResultViewController(coder: coder)
//        儲存漸層方式
        let starPoint = gradientLayer.startPoint
        let endPoint = gradientLayer.endPoint
//        儲存顏色
        let ResultColor = gradientLayer.colors
//        把顏色跟漸層方式都傳到下一頁的.resultInfo裡面
        controller?.resultInfo = resultgradientLayerInfo(ResultColor: ResultColor, resultEndpoint: endPoint, resultStarPoint: starPoint)
        return controller
    }
//    建立圖片跟View
    func backGroundView(){
//        宣告一張圖片
        let image = UIImage(named: "拉魯拉斯.png")
        let pokeImageView = UIImageView(image: image)
//        圖片的比例
        pokeImageView.contentMode = .scaleAspectFill
//        圖片跟View一樣大
        pokeImageView.frame = gradientview.bounds
//        漸層的區塊
        gradientLayer.frame = CGRect(x: 77, y: 125, width: 115, height: 120)
//        把漸層加入到gradientview裡
        gradientview.layer.addSublayer(gradientLayer)
//        把圖片加入到gradientview裡
        gradientview.addSubview(pokeImageView)
//        把gradientview加入到View裡
        view.addSubview(gradientview)
        print("pokeImageView.frame\(pokeImageView.frame)")
        print("gradientLayer.frame \(gradientLayer.frame )")
    }
    func updatUI(){
//        更新Label顯示文字
        fristRedLB.text = String(format: "%.0f", (fristRedSlider.value * 255))
        firstGreenLB.text = String(format: "%.0f", (fristGreenSlider.value * 255))
        fristBlueLB.text = String(format: "%.0f", (fristBlueSlider.value * 255))
        fristAlphaLB.text = String(format: "%.1f", (fristAlphaSlider.value))
        firstXpointLB.text = String(format: "%.1f", (starXpoint.value))
        fristYpointLB.text = String(format: "%.1f", (starYpointSlider.value))
        redSecLB.text = String(format: "%.0f", (secRedSlider.value * 255))
        greenSecLB.text = String(format: "%.0f", (secGreenSlider.value * 255))
        blueSecLB.text = String(format: "%.0f", (secBlueSlider.value * 255))
        alphaSecLB.text = String(format: "%.1f", (sceAlphaSlider.value))
        endXpointLB.text = String(format: "%.1f", (endXpoint.value))
        endYpointLB.text = String(format: "%.1f", (endYpoint.value))
    }
//   控制漸層顏色
    func changeGradient(){
        gradientLayer.colors = [UIColor(red: CGFloat(fristRedSlider.value), green: CGFloat(fristGreenSlider.value), blue: CGFloat(fristBlueSlider.value), alpha: CGFloat(fristAlphaSlider.value)).cgColor,UIColor(red: CGFloat(secRedSlider.value), green: CGFloat(secGreenSlider.value), blue: CGFloat(secBlueSlider.value), alpha: CGFloat(sceAlphaSlider.value)).cgColor]
        gradientLayer.startPoint = CGPoint(x: CGFloat(starXpoint.value), y:CGFloat( starYpointSlider.value))
        gradientLayer.endPoint = CGPoint(x: CGFloat(endXpoint.value), y: CGFloat(endYpoint.value))
//        讓label也會更新
        updatUI()
    }
//    亂數顏色
    func randomColor(){
        fristRedSlider.setValue(Float.random(in: 0...1), animated: true)
        fristBlueSlider.setValue(Float.random(in: 0...1), animated: true)
        fristGreenSlider.setValue(Float.random(in: 0...1), animated: true)
        fristAlphaSlider.setValue(Float.random(in: 0.1...1), animated: true)
        starXpoint.setValue(Float.random(in: 0.1...1), animated: true)
        starYpointSlider.setValue(Float.random(in: 0.1...1), animated: true)
        secRedSlider.setValue(Float.random(in: 0...1), animated: true)
        secBlueSlider.setValue(Float.random(in: 0...1), animated: true)
        secGreenSlider.setValue(Float.random(in: 0...1), animated: true)
        sceAlphaSlider.setValue(Float.random(in: 0.1...1), animated: true)
        endXpoint.setValue(Float.random(in: 0.1...1), animated: true)
        endYpoint.setValue(Float.random(in: 0.1...1), animated: true)
//        讓slider也會更新
        changeGradient()
        updatUI()
    }
//    全部改回來
    func reset(){
        fristRedSlider.setValue(1, animated: true)
        fristBlueSlider.setValue(1, animated: true)
        fristGreenSlider.setValue(1, animated: true)
        fristAlphaSlider.setValue(1, animated: true)
        starXpoint.setValue(0.5, animated: true)
        starYpointSlider.setValue(0, animated: true)
        secRedSlider.setValue(1, animated: true)
        secBlueSlider.setValue(1, animated: true)
        secGreenSlider.setValue(1, animated: true)
        sceAlphaSlider.setValue(1, animated: true)
        endXpoint.setValue(0.5, animated: true)
        endYpoint.setValue(1, animated: true)
        changeGradient()
        updatUI()
    }
    
    
}

