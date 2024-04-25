//
//  AVPlayer+Extension.swift
//  VideoApp_Swift_Version
//
//  Created by 이재훈 on 2024/01/03.
//

import AVKit

extension AVPlayer {
    
    func convertSeekableTimeRangesToString() -> String {
        guard let currentItem = self.currentItem,
              let seekableTimeRange = currentItem.seekableTimeRanges.first?.timeRangeValue
        else { return String("can't not convert TimeRanges to String") }
        
        return "\(seekableTimeRange.start.convertCMTimeToString()) ~ \(seekableTimeRange.end.convertCMTimeToString())"
    }
}
