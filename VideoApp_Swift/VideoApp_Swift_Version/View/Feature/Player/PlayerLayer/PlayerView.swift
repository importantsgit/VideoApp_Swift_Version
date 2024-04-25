//
//  PlayerView.swift
//  VideoApp_Swift_Version
//
//  Created by 이재훈 on 4/25/24.
//

import UIKit
import AVKit
import AVFoundation
import MediaPlayer

class PlayerView: UIView {
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    var playerItem: AVPlayerItem?
    
    var pipController: AVPictureInPictureController?
    var containerView: UIView?
    
    var periodicTimeObserver: Any?
    
    // PlayerLayout <- PlayerView
    private var playerStateEventHandler: ((_ event: PlayerStateEvent, _ param: Any?) -> Void)?
    
    func setPlayerStateEventHandler(eventHandler: @escaping (_ event: PlayerStateEvent, _ param: Any?)-> Void) {
        self.playerStateEventHandler = eventHandler
    }
    
    func sendPlayerStateEvent(event: PlayerStateEvent, param: Any?) {
        if playerStateEventHandler != nil {
            playerStateEventHandler!(event, param)
        }
    }
    
    func initView() {
        if playerLayer != nil {
            playerLayer?.frame = containerView?.bounds ?? .zero
        }
    }
    
    func startPlayer(controlContainer: UIView, urlString: String) {
        self.containerView = controlContainer
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            print("AVAudioSession active")
        }
        catch {
            print("AVAudioSession active fail: \(error.localizedDescription)")
        }
        
        self.frame = controlContainer.frame
        
        guard let videoURL = URL(string: urlString) else {return}
        
        if playerItem == nil {
            playerItem = AVPlayerItem(url: videoURL)
        }
        
        if player == nil {
            player = AVPlayer(url: videoURL)
        }
        
        if playerLayer == nil {
            playerLayer = AVPlayerLayer(player: player)
        }
        
        playerLayer?.frame = controlContainer.bounds
        // resizeAspect: 비율 맞춰 채우기, Fill: 꽉 채우기, resize: 전체화면 (비율 무시)
        playerLayer?.videoGravity = .resize
        
        controlContainer.layer.addSublayer(playerLayer!)
        
        player?.play()
        
        self.sendPlayerStateEvent(event: .PLAY, param: nil)
        
    }
    
    //MARK: - Observer
    func addPlayerObserver() {
        guard let player = self.player else { return }
        NotificationCenter.default.addObserver( self,
            selector: #selector(playerItemDidPlayToEndTime),
            name: .AVPlayerItemDidPlayToEndTime,
            object: player.currentItem
        )
        
        player.currentItem?.addObserver(self, forKeyPath: #keyPath(AVPlayerItem.status), options: [.old, .new], context: nil)
        player.currentItem?.addObserver(self, forKeyPath: #keyPath(AVPlayerItem.isPlaybackBufferFull), options: [.old, .new], context: nil)
        player.currentItem?.addObserver(self, forKeyPath: #keyPath(AVPlayerItem.isPlaybackBufferEmpty), options: [.old, .new], context: nil)
        player.currentItem?.addObserver(self, forKeyPath: #keyPath(AVPlayerItem.isPlaybackLikelyToKeepUp), options: [.old, .new], context: nil)
        player.currentItem?.addObserver(self, forKeyPath: #keyPath(AVPlayerItem.loadedTimeRanges), options: [.old, .new], context: nil)
        
        let interval = CMTime(seconds: 0.5, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        periodicTimeObserver = player.addPeriodicTimeObserver(forInterval: interval, queue: DispatchQueue.global(), using: { [weak self] currentTime in
            guard let currentItem = player.currentItem else { return }

            DispatchQueue.main.async {
                // seekbar Position 이벤트
                self?.sendPlayerStateEvent(event: .PLAYER_POSITION, param: currentItem)
            }
            
        })
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        switch keyPath {
        case #keyPath(AVPlayerItem.status):
            let status: AVPlayerItem.Status
            if let statusNumber = change?[.newKey] as? NSNumber {
                status = AVPlayerItem.Status(rawValue: statusNumber.intValue)!
            } else {
                status = .unknown
            }
            
            switch status {
            case .readyToPlay:
                NSLog("[Player] readyToPlay")
                break
            case .failed:
                if let player = self.player{
                    let errMessage = player.currentItem?.error?.localizedDescription
                    let err = player.currentItem?.error
                    NSLog("[Player] failed err: \(String(describing: err)) || errMessage: \(String(describing: errMessage))")
                }
                break
            case .unknown:
                NSLog("[Player] unknown")
                break
            default:
                break
            }
            
            break
        case #keyPath(AVPlayerItem.isPlaybackBufferFull):
            break
        case #keyPath(AVPlayerItem.isPlaybackBufferEmpty):
            break
        case #keyPath(AVPlayerItem.isPlaybackLikelyToKeepUp):
            break
        case #keyPath(AVPlayerItem.loadedTimeRanges):
            break
        default:
            return
        }
    }
    
    //MARK: - player Event
    @objc private func playerItemDidPlayToEndTime() {
        
    }
    
    func getPlayerStatus() -> AVPlayer.TimeControlStatus? {
        return player?.timeControlStatus
    }
    
    //MARK: - Audio Mode
    func audioBackgroundEvent(){
        playerLayer?.player = nil
    }
    
    func audioForegroundEvent(){
        playerLayer?.player = self.player
    }
    
    //MARK: - PIP Mode
    func activatePipMode(delegate: AVPictureInPictureControllerDelegate, isPIPActive: Bool) {
        guard AVPictureInPictureController.isPictureInPictureSupported() else { return }
        
        if isPIPActive {
            pipController = AVPictureInPictureController(playerLayer: playerLayer!)
            pipController?.delegate = delegate
        }
        else {
            pipController = nil
        }
    }
    
    //MARK: - Player Control
    func play() {
        if player?.rate == 0 {
            player?.play()
            self.sendPlayerStateEvent(event: .PLAY, param: nil)
        }
    }
    
    func stop(){
        player?.replaceCurrentItem(with: nil)
    }

    
    func pause() {
        player?.pause()
        self.sendPlayerStateEvent(event: .PAUSE, param: nil)
    }
    
    // 10초 전으로 이동
    func seekRewindInVideo(skipSeconds: Float64) {
        
    }
    
    // 10초 후로 이동
    func seekForwardInVideo(skipSeconds: Float64) {
        
    }
    
    func seekToPlay(ratioPosition: Float) {
        
    }
    
    func seekToTime(time: CMTime) {
        
    }
    

    
    func removePlayerObserver(){
        
        NotificationCenter.default.removeObserver(self)
        player?.currentItem?.removeObserver(self, forKeyPath: #keyPath(AVPlayerItem.status))
        player?.currentItem?.removeObserver(self, forKeyPath: #keyPath(AVPlayerItem.isPlaybackBufferFull))
        player?.currentItem?.removeObserver(self, forKeyPath: #keyPath(AVPlayerItem.isPlaybackBufferEmpty))
        player?.currentItem?.removeObserver(self, forKeyPath: #keyPath(AVPlayerItem.isPlaybackLikelyToKeepUp))
        player?.currentItem?.removeObserver(self, forKeyPath: #keyPath(AVPlayerItem.loadedTimeRanges))
    }
    
    deinit{
        if periodicTimeObserver != nil{
            self.player?.removeTimeObserver(periodicTimeObserver!)
            self.periodicTimeObserver = nil
        }
    }
}
