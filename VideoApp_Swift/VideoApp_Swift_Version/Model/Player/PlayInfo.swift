//
//  PlayInfo.swift
//  VideoApp_Swift_Version
//
//  Created by 이재훈 on 4/26/24.
//

import Foundation

struct PlayInfo: Codable {
    var playTitle: String?
    var videoURL: String?
}

extension PlayInfo {
    static let example: [PlayInfo] = [
        .init(
            playTitle: "1번째 영상",
            videoURL: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
        ),
        .init(
            playTitle: "2번째 영상",
            videoURL: "https://d21rxjywdcts3g.cloudfront.net/h264/CH_E/cmaf-hls/master.m3u8"
        ),
    ]
}
