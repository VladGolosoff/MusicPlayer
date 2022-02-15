//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Владислав Голосов on 15.02.2022.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {
    @IBOutlet weak var albumCover: UIImageView!
    @IBOutlet weak var trackTitle: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var fadeValueLabel: UILabel!
    @IBOutlet weak var fadeSlider: UISlider!
    
    let trackNames = [
    "Алла Пугачёва - Позови меня с собой",
    "The Qemists - Run You"
    ]
    
    func changeTrack() {
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        albumCover.image = UIImage(named: trackNames[1])
        trackTitle.text = trackNames[1]
        fadeValueLabel.text = "\(fadeSlider.value)"
//
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = view.bounds
//        gradientLayer.colors = [
//            UIColor.systemGreen.cgColor,
//            UIColor.systemBlue.cgColor
//        ]
//        view.layer.addSublayer(gradientLayer)
    }
    
    
}

