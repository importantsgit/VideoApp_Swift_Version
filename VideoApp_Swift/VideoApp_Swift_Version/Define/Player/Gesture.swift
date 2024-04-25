//
//  Gesture.swift
//  VideoApp_Swift_Version
//
//  Created by 이재훈 on 4/25/24.
//

import Foundation

public enum GestureDirection {
    case Unknown
    case UpDown
    case LeftRight
}

public enum SubGestureDirection {
    case Unknown
    case Left
    case Right
    case Top
    case Bottom
}

public struct Gesture {
    var direction: GestureDirection
    var subDirection: SubGestureDirection
    var startVal: CGFloat
    var standardVal: CGFloat
}

public enum Control {
    case None
    case Auto
    case Controller
    case Blind
    case Content
}
