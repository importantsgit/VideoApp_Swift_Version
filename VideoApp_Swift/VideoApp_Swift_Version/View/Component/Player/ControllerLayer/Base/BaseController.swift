//
//  BaseController.swift
//  VideoApp_Swift_Version
//
//  Created by 이재훈 on 4/25/24.
//

import UIKit

class BaseController: NSObject {
    public var controllerView = UIView()
    private var contentType = PlayerContentType.UNKNOWN
    
    func setSingleTap(){
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(singleTap))
        singleTap.numberOfTapsRequired = 1
        singleTap.cancelsTouchesInView = false
        controllerView.addGestureRecognizer(singleTap)
    }
    
    // override
    @objc func singleTap(gestureRecognizer : UITapGestureRecognizer) {}
}
