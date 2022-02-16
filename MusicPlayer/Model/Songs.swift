//
//  Songs.swift
//  MusicPlayer
//
//  Created by Владислав Голосов on 15.02.2022.
//

import AVKit

struct Song {
    var name = ""
    func fetchSong() -> AVPlayer {
        AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: name,
                                                            ofType: "mp3")!))
    }
}

let songs = [
    Song(name: "The Qemists - Run You"),
    Song(name: "Алла Пугачёва - Позови меня с собой")
    ]

