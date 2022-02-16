//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Владислав Голосов on 15.02.2022.
//


import AVKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var albumCover: UIImageView!
    @IBOutlet weak var trackTitle: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var fadeValueLabel: UILabel!
    @IBOutlet weak var fadeSlider: UISlider!
    
    //MARK: -Private properties
    
    private var player: AVPlayer!
    private var fadeTimer: Timer?
    
    //MARK: -Life Cycles Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        albumCover.image = UIImage(named: songs.first?.name ?? "")
        trackTitle.text = songs.first?.name ?? ""
        player = songs.first?.fetchSong()
        fadeValueLabel.text = "\(fadeSlider.value)"
    }
    
    //MARK: -IBActions
    
    @IBAction func playButtonPressed() {
        if player.timeControlStatus  == .playing {
            playButton.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
            player.pause()
        } else {
            playButton.setImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
            setupPlayer(fade: fadeSlider.value)
        }
    }
    
    @IBAction func changeSong() {
        if trackTitle.text == songs.first?.name {
            player.pause()
            player = songs.last?.fetchSong()
            albumCover.image = UIImage(named: songs.last?.name ?? "")
            trackTitle.text = songs.last?.name ?? ""
            if playButton.currentImage == UIImage(systemName: "pause.circle.fill") {
                setupPlayer(fade: fadeSlider.value)
            }
        } else {
            player.pause()
            player = songs.first?.fetchSong()
            albumCover.image = UIImage(named: songs.first?.name ?? "")
            trackTitle.text = songs.first?.name ?? ""
            if playButton.currentImage == UIImage(systemName: "pause.circle.fill") {
                setupPlayer(fade: fadeSlider.value)
            }
        }
    }
    
    @IBAction func fadeSliderAction() {
        fadeValueLabel.text = String(fadeSlider.value.rounded())
    }
    
    //MARK: - Private methods
    
    private func setupPlayer(fade: Float) {
        player.volume = 0
        fadeTimer = player.fadeVolume(from: 0, to: 1, duration: fade)
        player.play()
    }
}

