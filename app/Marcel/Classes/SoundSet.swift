//  Copyright 2018 Ryan Gomba. All rights reserved.

import UIKit
import AVKit

class SoundSet: NSObject {

  var player: AVPlayer
  var sounds: [String]
  var currentIndex: Int

  init(sounds: [String]) {
    self.player = AVPlayer.init()
    self.sounds = sounds
    self.currentIndex = 0

    super.init()
  }

  func playNextSound() {
    let soundName = self.sounds[self.currentIndex]
    let url = Bundle.main.url(forResource: soundName, withExtension: "m4a")
    let playerItem = AVPlayerItem.init(url: url!)
    self.player.replaceCurrentItem(with: playerItem)
    self.player.play()

    self.currentIndex += 1
    if (self.currentIndex >= self.sounds.count) {
      self.currentIndex = 0;
    }
  }

}
