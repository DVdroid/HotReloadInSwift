//
//  ViewController.swift
//  HotReloadInSwift
//
//  Created by VA on 09/04/22.
//

import UIKit
import Inject

final class ViewController: UIViewController {

    private lazy var customView: _InjectableViewHost<CustomView> = {
        let view = CustomView()
        let injectableView = Inject.ViewHost(view)
        injectableView.translatesAutoresizingMaskIntoConstraints = false
        return injectableView
    }()
    
    private lazy var tapMeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Tap Me", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(tapMeAction), for: .primaryActionTriggered)
        return button
    }()
    
    @objc private func tapMeAction() {
        let newViewController = Inject.ViewControllerHost(UIViewController())
        newViewController.view.backgroundColor = .cyan
        show(newViewController, sender: self)
    }
    
    private func setupSubViews() {
        setupLabel()
        customView.label.text = "Hello World!!!"
    }
    
    private func setupLabel() {
        view.addSubview(customView)
        NSLayoutConstraint.activate([
            customView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setupTapMeButton() {
        view.addSubview(tapMeButton)
        NSLayoutConstraint.activate([
            tapMeButton.widthAnchor.constraint(equalToConstant: 150),
            tapMeButton.heightAnchor.constraint(equalToConstant: 60),
            tapMeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            view.bottomAnchor.constraint(equalTo: tapMeButton.bottomAnchor, constant: 100)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.systemBackground
        setupSubViews()
        setupTapMeButton()
    }
}

