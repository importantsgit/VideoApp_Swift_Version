//
//  Constraint+Util.swift
//  VideoApp_Swift_Version
//
//  Created by 이재훈 on 4/26/24.
//
import UIKit

enum AncherType {
    case top(_ constrant: CGFloat)
    case bottom(_ constrant: CGFloat)
    case left(_ constrant: CGFloat)
    case right(_ constrant: CGFloat)
}

// Contraint 세팅 로직
extension UIView {
    
    /** 부모뷰 기준 Constraint 세팅*/
    @discardableResult
    func add(to superview: inout UIView,
             _ top: AncherType?      = nil,
             _ bottom: AncherType?   = nil,
             _ left: AncherType?     = nil,
             _ right: AncherType?    = nil,
             centerX: Bool         = false,
             centerY: Bool         = false
    ) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        superview.addSubview(self)
        
        if case let .top(constant) = top {
            self.topAnchor
                .constraint(equalTo: superview.topAnchor, constant: constant)
                .isActive = true
        }
        
        if case let .bottom(constant) = bottom {
            self.bottomAnchor
                .constraint(equalTo: superview.bottomAnchor, constant: -constant)
                .isActive = true
        }
        
        if case let .left(constant) = left {
            self.leftAnchor
                .constraint(equalTo: superview.leftAnchor, constant: constant)
                .isActive = true
        }
        
        if case let .right(constant) = right {
            self.rightAnchor
                .constraint(equalTo: superview.rightAnchor, constant: -constant)
                .isActive = true
        }
        
        if centerX {
            self.centerXAnchor
                .constraint(equalTo: superview.centerXAnchor)
                .isActive = true
        }
        
        if centerY {
            self.centerYAnchor
                .constraint(equalTo: superview.centerYAnchor)
                .isActive = true
        }
        
        return self
    }
    
    /** 형제뷰 기준 Constraint 세팅*/
    @discardableResult
    func setConstraint(
             _ top: (AncherType, UIView)?      = nil,
             _ bottom: (AncherType, UIView)?   = nil,
             _ left: (AncherType, UIView)?     = nil,
             _ right: (AncherType, UIView)?    = nil,
             equalCenterX: UIView?             = nil,
             equalCenterY: UIView?             = nil
    ) -> Self {
        
        if let top = top,
           case let .top(constant) = top.0 {
            self.topAnchor
                .constraint(equalTo: top.1.bottomAnchor, constant: constant)
                .isActive = true
        }
        
        if let bottom = bottom,
           case let .bottom(constant) = bottom.0 {
            self.bottomAnchor
                .constraint(equalTo: bottom.1.topAnchor, constant: -constant)
                .isActive = true
        }
        
        if let left = left,
           case let .left(constant) = left.0 {
            self.leftAnchor
                .constraint(equalTo: left.1.rightAnchor, constant: constant)
                .isActive = true
        }
        
        if let right = right,
           case let .right(constant) = right.0 {
            self.rightAnchor
                .constraint(equalTo: right.1.leftAnchor, constant: -constant)
                .isActive = true
        }
        
        if let centerX = equalCenterX {
            self.centerXAnchor
                .constraint(equalTo: centerX.centerXAnchor)
                .isActive = true
        }
        
        if let centerY = equalCenterY {
            self.centerYAnchor
                .constraint(equalTo: centerY.centerYAnchor)
                .isActive = true
        }
        
        return self
    }

    /** 너비, 높이 Constraint 세팅*/
    @discardableResult
    func setSize(_ length: CGFloat) -> Self {
        setSize(width: length, height: length)
        return self
    }
    
    func setSize(width: CGFloat? = nil, height: CGFloat? = nil) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let width = width {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
