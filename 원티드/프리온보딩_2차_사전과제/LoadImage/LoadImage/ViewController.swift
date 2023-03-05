//
//  ViewController.swift
//  LoadImage
//
//  Created by 박승찬 on 2023/03/05.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imgView1: UIImageView!
    @IBOutlet weak var imgView2: UIImageView!
    @IBOutlet weak var imgView3: UIImageView!
    @IBOutlet weak var imgView4: UIImageView!
    @IBOutlet weak var imgView5: UIImageView!
    
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    
    @IBOutlet weak var btnAll: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clickedBtn1(_ sender: Any) {
        
        imgView1.image = UIImage(systemName: "photo")
        let url = URL(string: "https://images.ctfassets.net/hrltx12pl8hq/a2hkMAaruSQ8haQZ4rBL9/8ff4a6f289b9ca3f4e6474f29793a74a/nature-image-for-website.jpg?fit=fill&w=480&h=320")
        imgView1.downloadImage(from: url!)
        
    }
    @IBAction func clickedBtn2(_ sender: Any) {
        imgView2.image = UIImage(systemName: "photo")
        let url = URL(string: "https://cdn.pixabay.com/photo/2016/09/19/07/01/lake-1679708__480.jpg")
        imgView2.downloadImage(from: url!)
    }
    @IBAction func clickedBtn3(_ sender: Any) {
        imgView3.image = UIImage(systemName: "photo")
        let url = URL(string: "https://www.state.gov/wp-content/uploads/2022/01/shutterstock_545718292-scaled.jpg")
        imgView3.downloadImage(from: url!)
    }
    @IBAction func clickedBtn4(_ sender: Any) {
        imgView4.image = UIImage(systemName: "photo")
        let url = URL(string: "https://imageio.forbes.com/specials-images/imageserve/631f5886435018e566d05f3b/Maroon-Bells-autumn-aspen-trees-lake-reflections-Aspen-Colorado/960x0.jpg?format=jpg&width=960")
        imgView4.downloadImage(from: url!)
    }
    @IBAction func clickedBtn5(_ sender: Any) {
        imgView5.image = UIImage(systemName: "photo")
        let url = URL(string: "https://cdn.pixabay.com/photo/2015/10/01/17/17/car-967387__480.png")
        imgView5.downloadImage(from: url!)
    }
    @IBAction func clickedBtnAll(_ sender: Any) {
        clickedBtn1(btn1!)
        clickedBtn2(btn2!)
        clickedBtn3(btn3!)
        clickedBtn4(btn4!)
        clickedBtn5(btn5!)
    }
    
    
}
extension UIImageView {
   func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
      URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
   }
   func downloadImage(from url: URL) {
      getData(from: url) {
         data, response, error in
         guard let data = data, error == nil else {
            return
         }
         DispatchQueue.main.async() {
            self.image = UIImage(data: data)
         }
      }
   }
}
