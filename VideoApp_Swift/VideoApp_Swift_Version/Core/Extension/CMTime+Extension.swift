//
//  CMTIME.swift
//  VideoApp_Swift_Version
//
//  Created by 이재훈 on 2024/01/03.
//

import AVKit

extension CMTime {
    
    func convertCMTimeToString() -> String {
        let timeInSeconds = CMTimeGetSeconds(self)
        
        let hours = Int(timeInSeconds) / 3600
        let minutes = Int(timeInSeconds) / 60 % 60
        let seconds = Int(timeInSeconds) % 60
        
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}
