//
//  LandscapeController.swift
//  VideoApp_Swift_Version
//
//  Created by 이재훈 on 4/25/24.
//

import UIKit
import AVFoundation
import MediaPlayer

class LandscapeController: BaseController {
    var topView = UIView()
    var bottomView = UIView()
    var centerStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        
        return stackView
    }()
    
    var titleLabel = UILabel()
    
    var backButton = ImageButton(
        image: .init(defaultName: "icon26BackWhite"))
    
    var settingButton = ImageButton(
        image: .init(defaultName: "icon26MoreWhite"))
    
    var playButton = ImageButton(
        image: .init(defaultName: "icon26BackWhite"))
    
    var rewindButton = ImageButton(
        image: .init(defaultName: "icon46SkipFrontWhite"))
    
    var forwardButton = ImageButton(
        image: .init(defaultName: "icon46SkipBackWhite"))
    
    var zoomOutButton = ImageButton(
        image: .init(defaultName: "icon26ZoomOutWhite"))
    
    
    var liveImageView = UIImageView(image: UIImage(named: "tagLive"))
    var seekPostionView = UIView()
    var seekBarView = UIView()
    
    // var liveImageView
    var playTimeLabel = UILabel()
    
}


fileprivate extension LandscapeController {
    
    func setController() {
        setupLayout()
    }
    
    func setupLayout() {
        
        //MARK: - TopView
        topView
            .add(to: &controllerView, .top(20), .left(0), .right(0))
            .setSize(height: 62)
        
        backButton
            .add(to: &topView, .left(52), centerY: true)
            .setSize(42)
    
        titleLabel
            .add(to: &topView, centerY: true)
            .setConstraint((.left(0), backButton))
        
        settingButton
            .add(to: &topView, .right(52), centerY: true)
            .setSize(42)
        
        //MARK: - CenterView
        centerStackView
            .add(to: &controllerView, centerX: true)
            .setConstraint((.top(49), topView))
        
        [rewindButton, playButton, forwardButton].forEach {
            centerStackView.addArrangedSubview($0)
            $0.setSize(72)
        }
        
        //MARK: - BottomView
        bottomView
            .add(to: &controllerView, .bottom(64), .left(0), .right(0))
            .setConstraint((.top(65), centerStackView))
            .setSize(height: 62)
        
        zoomOutButton
            .add(to: &bottomView, .right(52), centerY: true)
            .setSize(42)
    }
    
    

    func setupButtonAction() {
        
    }
}
