//
//  UIButton+Util.swift
//  VideoApp_Swift_Version
//
//  Created by 이재훈 on 2024/01/03.
//

import UIKit

class PlayerButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public func setupImages(image: UIImage, padding: CGFloat) {
        var config = UIButton.Configuration.plain()
        config.image = image
        config.imagePadding = padding
        config.imagePlacement = .all
        self.configuration = config
    }
}
