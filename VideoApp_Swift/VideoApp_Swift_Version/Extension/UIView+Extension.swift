//
//  UIView+Extension.swift
//  VideoApp_Swift_Version
//
//  Created by 이재훈 on 2024/01/03.
//

import UIKit

extension UIView {
    
    /** 뷰를 돌리는 함수 */
    func rotate(angle: CGFloat) {
        let radians = angle / 180.0 * CGFloat.pi
        let rotation = CGAffineTransform(rotationAngle: radians)
        self.transform = rotation
    }
}

extension UILabel {
    
    /** 줄 간격을 주는 함수 */
    func setTextWithLineHeight(text: String?, lineHeight: CGFloat) {
        if let text = text {
            let style = NSMutableParagraphStyle()
            style.maximumLineHeight = lineHeight
            style.minimumLineHeight = lineHeight
            
            let attributes: [NSAttributedString.Key: Any] = [
                .paragraphStyle: style
            ]
                
            let attrString = NSAttributedString(
                string: text,
                attributes: attributes
            )
            
            self.attributedText = attrString
        }
    }
    
    /** 문자 간격을 주는 함수 */
    func addCharacterSpacing(kernValue: Double = 1.15) {
      guard let text = text,
                !text.isEmpty else { return }
        
      let string = NSMutableAttributedString(string: text)
        
      string.addAttribute(
         NSAttributedString.Key.kern,
         value: kernValue,
         range: NSRange(location: 0, length: string.length - 1)
      )
        
      attributedText = string
    }
}
