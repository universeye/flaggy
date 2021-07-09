//
//  AnimatedLabel.swift
//  Flaggy
//
//  Created by Terry Kuo on 2021/6/23.
//

import UIKit

class AnimatedLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        font = UIFont.systemFont(ofSize: 14, weight: .bold)
        frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        center = CGPoint(x: 230, y: 130)
        alpha = 0
        transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        textColor = .white
    }
    
}
