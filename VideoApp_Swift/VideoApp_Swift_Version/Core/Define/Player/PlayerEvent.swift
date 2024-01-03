//
//  PlayerEvent.swift
//  VideoApp_Swift_Version
//
//  Created by 이재훈 on 2024/01/03.
//

import AVKit
/***
 PlayerContainer와 Portrait/Landscape Controller간 이벤트 리스트(Player에게 직접 전달하기 위함)
 */
public enum PlayerControllerEvent{
    case PLAY
    case STOP
    case RATIO
    case SPEED
    case QUALITY
    case RESUME
    case PAUSE
    case REWIND
    case FORWARD
    case PLAYER_POSITION
    case MUTE
    case UNMUTE
    case LANDSCAPE
    case PORTRAIT
    case LOCK
    case UNLOCK
    case SEEK
    case SETTING
    case AUDIO_MODE
    case CLOSE
    case OTHERGAMES_TAPPED
}

/***
 Player에서 전달되는 상태 리스트
 */
public enum PlayerStateEvent{
    case RENDERED
    case ERR
    case BUFFERING
    case BUFFERDONE
    case ENDED
    case PLAYER_POSITION
    case PLAY
    case PAUSE
}

public enum PlayerNetworkEvent{
    case API_CALL
}

public enum PlayerContentType{
    case LIVE
    case VOD
    case UNKNOWN
}

/***
 PortraitController에서 사용되는 이벤트 리스트(NSObject를 상속받는 UIView에 연결된 제스쳐들을 위함)
 */
public enum PortraitControllerEvent{
    case PLAY
    case STOP
    case RESUME
    case PAUSE
    case REWIND
    case FORWARD
    case MUTE
    case UNMUTE
    case LANDSCAPE
    case PORTRAIT
    case LOCK
    case UNLOCK
    case SEEK
    case SETTING
    case AUDIO_MODE
    case LIVE_SEEK
}

public enum AudioModeControllerEvent{
    case CLOSE
    case PLAY
    case PAUSE
}

/***
 LandscapeController에서 사용되는 이벤트 리스트(NSObject를 상속받는 UIView에 연결된 제스쳐들을 위함)
 */
public enum LandscapeControllerEvent{
    case PLAY
    case STOP
    case RESUME
    case PAUSE
    case REWIND
    case FORWARD
    case MUTE
    case UNMUTE
    case LANDSCAPE
    case PORTRAIT
    case LOCK
    case UNLOCK
    case SEEK
    case SETTING
    case AUDIO_MODE
    case OTHER_GAMES
    case CHEERING_TALK
    case LIVE_SEEK
    case VIDEO_QUALITY
    case ASPECT_RATIO
    case PLAYBACK_SPEED
}

/***
 OtherGamesView에서 사용되는 이벤트 리스트
 */
public enum OtherGamesViewEvent {
    case REFRESH
    case OTHERGAMES_TAPPED
    case CLOSE
}

/***
 SettingView에서 사용되는 이벤트 리스트
 */
public enum SettingViewEvent {
    case RATIO
    case QUALITY
    case SPEED
    case CLOSE
}

/***
 SettingView에서 사용되는 화질 이벤트 리스트
 */
public enum VideoQualityOption {
    case AUTO
    case P1080
    case P720
    case P480
}

/***
 SettingView에서 사용되는 화면 비율 이벤트 리스트
 */
public enum AspectRatioOption {
    case ORIGINAL
    case FULLSCREEN
}

/***
 SettingView에서 사용되는 재생 속도 이벤트 리스트
 */
enum PlaybackSpeedOption {
    case HALF
    case NORMAL
    case ONE_QUARTER
    case ONE_HALF
    case DOUBLE
}
