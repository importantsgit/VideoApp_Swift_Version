//
//  PlayerLayout.swift
//  VideoApp_Swift_Version
//
//  Created by 이재훈 on 4/25/24.
//

import UIKit
import AVKit
import AVFoundation
import MediaPlayer

class PlayerLayout: UIView {
    var playerView: PlayerView?
    
    private var playerStateEventHandler: ((_ event: PlayerStateEvent, _ param: Any?) -> Void)?
    
    func setPlayerStateEventHandler(eventHandler: @escaping (_ event: PlayerStateEvent, _ param: Any?) -> Void) {
        self.playerStateEventHandler = eventHandler
    }
    
    func sendPlayerStateEvent(event: PlayerStateEvent, param: Any?) {
        if playerStateEventHandler != nil {
            playerStateEventHandler?(event, param)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        if playerView == nil {
            playerView = PlayerView()
        }
        
        self.addSubview(playerView!)
        playerView?.frame = self.bounds
        playerView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        playerView?.setPlayerStateEventHandler(eventHandler: { [weak self] (event, param) in
            self?.sendPlayerStateEvent(event: event, param: param)
        })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startPlayer(playerController: UIView, urlString: String){
        playerView?.startPlayer(controlContainer: self, urlString: urlString)
    }
    
     func audioBackgroundEvent(){
         playerView?.audioBackgroundEvent()
     }
     
     func audioForegroundEvent(){
         playerView?.audioForegroundEvent()
     }
     
    func activatePipMode(delegate: AVPictureInPictureControllerDelegate, isActive: Bool){
        playerView?.activatePipMode(delegate: delegate, isPIPActive: isActive)
     }
    
    func play() {
        playerView?.play()
    }
    
    func pause() {
        playerView?.pause()
    }
    
    func stop(){
        playerView?.stop()
    }
    
    func getPlayerStatus() -> AVPlayer.TimeControlStatus?{
        return playerView?.getPlayerStatus()
    }
    
    func seekToPlay(ratioPosition: Float){
        playerView?.seekToPlay(ratioPosition: ratioPosition)
    }
    
    func seekToTime(time: CMTime){
        playerView?.seekToTime(time: time)
    }
    
    func seekRewindInVideo(skipSeconds: Float64) {
        playerView?.seekRewindInVideo(skipSeconds: skipSeconds)
    }
    
    func seekForwardInVideo(skipSeconds: Float64) {
        playerView?.seekForwardInVideo(skipSeconds: skipSeconds)
    }
}
