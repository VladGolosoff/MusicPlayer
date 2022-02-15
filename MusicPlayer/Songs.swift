//
//  Songs.swift
//  MusicPlayer
//
//  Created by Владислав Голосов on 15.02.2022.
//

import MediaPlayer

struct Song {
    var name = ""
    func fetchSong() -> AVPlayer {
        AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: name,
                                                            ofType: "mp3")!))
    }
}
