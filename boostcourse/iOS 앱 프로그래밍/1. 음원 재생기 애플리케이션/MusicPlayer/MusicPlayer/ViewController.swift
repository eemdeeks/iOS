//
//  ViewController.swift
//  MusicPlayer
//
//  Created by 박승찬 on 2022/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK : IBOutlets
    @IBOutlet var playPauseButton: UIButton!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var progressSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

