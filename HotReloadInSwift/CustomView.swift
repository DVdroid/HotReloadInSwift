//
//  CustomView.swift
//  HotReloadInSwift
//
//  Created by Vikash Anand on 17/04/22.
//

import UIKit

final class CustomView: UIView {
    
   lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .red
        return label
    }()
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initilize()
    }
    
    private func initilize() {
        setUpLabel()
        backgroundColor = .lightGray
        layer.cornerRadius = 20
        layer.shadowOffset = CGSize(width: 10, height: 10)
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.3
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        
        widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.5).isActive = true
        heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.3).isActive = true
    }
    
    private func setUpLabel() {
        addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
