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
    var delegate: PlayerInterfaceDelegate?
    
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    var pipController: AVPictureInPictureController?
    
    var playerContainer: PlayerContainer?
    
    public func setDelegate(delegate: PlayerInterfaceDelegate) {
        self.delegate = delegate
    }
    
    public func setPlayerContainer(container: UIView){
        if playerContainer == nil{
            playerContainer = PlayerContainer()
            playerContainer?.setIntefaceDelegate(delegate: self.delegate)
        }
        container.addSubview(playerContainer!)
        playerContainer!.frame = container.bounds
        playerContainer!.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
}
