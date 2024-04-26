//
//  UIButton+Util.swift
//  VideoApp_Swift_Version
//
//  Created by 이재훈 on 2024/01/03.
//

import UIKit

struct ButtonImage {
    var defaultName: String
    var selectedName: String
    var padding: CGFloat
    
    init(
        defaultName: String,
        selectedName: String? = nil,
        padding: CGFloat = 0
    ) {
        self.defaultName = defaultName
        self.selectedName = selectedName ?? defaultName
        self.padding = padding
    }
}

@available (iOS 15.0, *)
class ImageButton: UIButton {

    private var buttonImage: ButtonImage?
    private var title: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    convenience init(
        image: ButtonImage
    ) {
        self.init(frame: .zero)
        self.buttonImage = image
        
        setButtonUpdateHandler()
    }

    private func setupButtonImage(_ state: UIControl.State) -> UIButton.Configuration? {
        guard let buttonImage = buttonImage 
        else { return nil }
        
        var config = UIButton.Configuration.plain()
        config.image = UIImage(named: state == .normal ? buttonImage.defaultName : buttonImage.selectedName)
        config.imagePadding = buttonImage.padding
        config.imagePlacement = .all
        
        return config
    }
    
    public func setButtonUpdateHandler() {
        self.configurationUpdateHandler = {
            guard let configration = self.setupButtonImage($0.state)
            else { return }
            $0.configuration = configration
        }
    }
}
