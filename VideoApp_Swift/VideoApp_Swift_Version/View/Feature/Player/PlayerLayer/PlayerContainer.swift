//
//  PlayerContainer.swift
//  VideoApp_Swift_Version
//
//  Created by 이재훈 on 2024/01/03.
//

import UIKit
import AVKit
import AVFoundation
import MediaPlayer


class PlayerContainer: UIView {
    
    // PlayerLayer를 가진 PlayerView를 가진 뷰
    var playerLayout: PlayerLayout?
    
    // 컨트롤러를 가진 뷰
    var portraitControlContainer: PortraitControlContainer?
    var landscapeControlContainer: LandscapeControlContainer?
    
    // App <- Player 인터페이스
    var playerInterfaceDelegate: PlayerInterfaceDelegate?
    
    // Live / VOD 구분을 위해 타입 설정
    var contentType: PlayerContentType = .UNKNOWN
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initPlayerView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init has not been implemented")
    }
    
    func setIntefaceDelegate(delegate: PlayerInterfaceDelegate?){
        self.playerInterfaceDelegate = delegate
    }
    
    func initPlayerView(){
        if playerLayout == nil{
            playerLayout = PlayerLayout()
        }
        
        self.addSubview(playerLayout!)
        playerLayout!.frame = self.bounds
        playerLayout!.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        playerLayout?.setPlayerStateEventHandler(eventHandler: {
            [weak self] event, param in
            
            switch event {
            case .ENDED:
                if self?.portraitControlContainer != nil{
                    
                }
                if self?.portraitControlContainer != nil{
                    
                }
                break
            case .PLAYER_POSITION:
                if self?.portraitControlContainer != nil{
                    
                }
                if self?.landscapeControlContainer != nil{
                    
                }
                break
            case .PLAY:
                if self?.portraitControlContainer != nil{
                    
                }
                if self?.landscapeControlContainer != nil{
                    
                }
                break
            case .PAUSE:
                if self?.portraitControlContainer != nil{
                    
                }
                if self?.landscapeControlContainer != nil{
                    
                }
                break
            default:
                break
            }
        })
    }
    
    func startPlayer(urlString: String, title: String){
        playerLayout?.startPlayer(playerController: self, urlString: urlString)
    }
    
    
}
