//
//  PlayerInterface.swift
//  VideoApp_Swift_Version
//
//  Created by 이재훈 on 2024/01/03.

import UIKit
import AVFoundation
import MediaPlayer
import AVKit

public protocol PlayerInterfaceDelegate {
    func onReceivePlayerStateEvent(event: PlayerStateEvent, param: Any?)
    func onReceivePlayerControllerEvent(event: PlayerControllerEvent, param: Any?)
    func onReceivePlayerNetworkEvent(event: PlayerNetworkEvent, param: Any?)
}

public class PlayerInterface {
    var interfaceDelegate: PlayerInterfaceDelegate?
    
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    var pipController: AVPictureInPictureController?
}
