//
//  BaseController.swift
//  VideoApp_Swift_Version
//
//  Created by 이재훈 on 4/25/24.
//

import UIKit
import AVFoundation
import MediaPlayer

class BaseControlContainerView: UIView, UIGestureRecognizerDelegate {
    private var contentType: PlayerContentType = .UNKNOWN
    private var isAudioModeActive: Bool = false
    
    private var controllerEventHandler: ((_ event: PlayerControllerEvent, _ param: Any?) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
