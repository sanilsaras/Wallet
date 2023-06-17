//
//  WalletDetailsViewController.swift
//  MyApp
//
//  Created by Sanil on 17/06/23.
//

import UIKit

class WalletDetailsViewController: UIViewController {
    var subWallet = [Wallet]()
    let priceLabel1: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let priceLabel2: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        let stackView : UIStackView = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.distribution = .fillEqually
            stack.translatesAutoresizingMaskIntoConstraints = false
            return stack
        }()
        let tableView: UITableView = {
            let tableView = UITableView()
            tableView.register(WalletTableViewCell.self, forCellReuseIdentifier: WalletTableViewCell.identifier)
            tableView.backgroundColor = .systemBackground
            tableView.translatesAutoresizingMaskIntoConstraints = false
            return tableView
        }()
        override func viewDidLoad() {
            super.viewDidLoad()
            title = "BTC Wallets"
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back")?.withRenderingMode(.alwaysTemplate), style: .done, target: self, action: #selector(didTapBackButton))
            navigationItem.leftBarButtonItem?.tintColor = .systemGray
            view.backgroundColor = .secondarySystemBackground
            view.addSubview(stackView)
            view.addSubview(tableView)
            stackView.addArrangedSubview(priceLabel1)
            stackView.addArrangedSubview(priceLabel2)
            tableView.delegate = self
            tableView.dataSource = self
            tableView.reloadData()
        }
    @objc private func didTapBackButton(){
        self.dismiss(animated: true)
    }
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                stackView.heightAnchor.constraint(equalToConstant: 80),
               
                tableView.topAnchor.constraint(equalTo: stackView.bottomAnchor),
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                
            ])
        }
    }
    extension WalletDetailsViewController : UITableViewDelegate,UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return subWallet.count
           
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
             let cell = tableView.dequeueReusableCell(withIdentifier: "WalletTableViewCell", for: indexPath) as! WalletTableViewCell
            cell.configureSub(subWallet: subWallet[indexPath.row])
            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 110
        }
        
        
    }
