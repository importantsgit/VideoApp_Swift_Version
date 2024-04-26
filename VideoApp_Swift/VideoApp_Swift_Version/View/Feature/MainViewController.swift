//
//  ViewController.swift
//  VideoApp_Swift_Version
//
//  Created by 이재훈 on 2024/01/03.
//

import UIKit

class MainViewController: UIViewController {

    var button = ImageButton(image: .init(defaultName: "tagLive"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        
    }

}
extension MainViewController {
    private func setupLayout() {
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        button
            .add(to: &view, centerX: true, centerY: true)
            .setSize(40)
    }
}

