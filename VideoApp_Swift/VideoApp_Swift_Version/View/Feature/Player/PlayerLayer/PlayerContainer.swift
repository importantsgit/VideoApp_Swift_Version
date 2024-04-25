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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init has not been implemented")
    }
    
    
    
}
