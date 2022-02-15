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
    
    var player: AVPlayer!
    var playerQueue = [
        Song(name: "The Qemists - Run You"),
        Song(name: "Алла Пугачёва - Позови меня с собой")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        albumCover.image = UIImage(named: playerQueue.first?.name ?? "")
        trackTitle.text = playerQueue.first?.name ?? ""
        player = playerQueue.first?.fetchSong()
        fadeValueLabel.text = "\(fadeSlider.value)"
        
    }
    
    @IBAction func playButtonPressed() {
        if player.timeControlStatus  == .playing {
            playButton.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
            player.pause()
        } else {
            playButton.setImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
            player.play()
        }
    }
    @IBAction func changeSong() {
        if trackTitle.text == playerQueue.first?.name {
            player = playerQueue.last?.fetchSong()
            albumCover.image = UIImage(named: playerQueue.last?.name ?? "")
            trackTitle.text = playerQueue.last?.name ?? ""
            if playButton.currentImage == UIImage(systemName: "pause.circle.fill") {
                player.play()
            }
            
        } else {
            player = playerQueue.first?.fetchSong()
            albumCover.image = UIImage(named: playerQueue.first?.name ?? "")
            trackTitle.text = playerQueue.first?.name ?? ""
            if playButton.currentImage == UIImage(systemName: "pause.circle.fill") {
                player.play()
            }
        }
        
        
    }
    
    
}

