//
//  LoginViewController.swift
//  MyApp
//
//  Created by Sanil  on 17/06/23.
//

import UIKit

class ViewController : UIViewController {
    private let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log in", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loginButton)
        view.backgroundColor = .systemGray6
        loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        NSLayoutConstraint.activate([
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        loginButton.heightAnchor.constraint(equalToConstant: 48),
        loginButton.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    @objc func didTapLogin(){
        let vc = MainViewController()
        let navVC = UINavigationController(rootViewController: vc)
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true)
 
    }
}

