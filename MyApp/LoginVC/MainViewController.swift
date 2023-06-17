//
//  MainViewController.swift
//  MyApp
//
//  Created by Sanil on 17/06/23.
//

import UIKit

class MainViewController: UITabBarController {

    let itemImage = ["magnifyingglass","bag","plus","heart","line.3.horizontal"]
    private let addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBackground
        button.layer.cornerRadius = 25
        button.setImage(UIImage(named: "add"), for: .normal)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarSetUp()
        tabBar.addSubview(addButton)
        addButton.addTarget(self, action: #selector(didtapAdd), for: .touchUpInside)
        tabBar.backgroundColor = .systemGray4
    }
    @objc private func didtapAdd(){
        let vc = AddNewViewController()
//        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    private func tabBarSetUp(){
        tabBar.backgroundColor = .tertiarySystemBackground
        let vc1 = TradeViewController()
        let vc2 = ShopViewController()
        let vc3 = AddNewViewController()
        let vc4 = InviteViewController()
        let vc5 = MenuViewController()
        
        setViewControllers([vc1,vc2,vc3,vc4,vc5], animated: true)
     
        vc1.tabBarItem.title = "Trade"
        vc2.tabBarItem.title = "Shop"
        vc4.tabBarItem.title = "Invite"
        vc5.tabBarItem.title = "Menu"
        
        vc1.tabBarItem.image = UIImage(systemName:itemImage[0])
        vc2.tabBarItem.image = UIImage(systemName: itemImage[1])
        vc4.tabBarItem.image = UIImage(systemName: itemImage[3])
        vc5.tabBarItem.image = UIImage(systemName: itemImage[4])
   
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        NSLayoutConstraint.activate([
            addButton.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
            addButton.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: -25),
            addButton.widthAnchor.constraint(equalToConstant: 50),
            addButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
