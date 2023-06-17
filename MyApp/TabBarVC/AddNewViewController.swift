//
//  AddNewViewController.swift
//  MyApp
//
//  Created by Sanil on 17/06/23.
//

import UIKit

class AddNewViewController: UIViewController {
    var myWallet : WalletModel?
    var isCrypto : Bool = false
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.text = "My Wallets"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let view1: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let view2: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let positionView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let positionView2: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let fiatButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Flat", for: .normal)
        button.backgroundColor = .systemBackground
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        return button
    }()
    private let cryptoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Crypto", for: .normal)
        button.backgroundColor = .systemBackground
        button.setTitleColor(UIColor.label, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        return button
    }()
    let stackView : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
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
        view.backgroundColor = .secondarySystemBackground
        view.addSubview(titleLabel)
        view.addSubview(stackView)
        stackView.addSubview(view1)
        view.addSubview(tableView)
        stackView.addSubview(view2)
        view1.addSubview(positionView)
        view2.addSubview(positionView2)
        view1.addSubview(fiatButton)
        view2.addSubview(cryptoButton)
        stackView.addArrangedSubview(view1)
        stackView.addArrangedSubview(view2)
        fiatButton.addTarget(self, action: #selector(didtapFlat), for: .touchUpInside)
        cryptoButton.addTarget(self, action: #selector(didtapCrypto), for: .touchUpInside)
        callApi()
        tableView.delegate = self
        tableView.dataSource = self
    }
    @objc private func didtapFlat(){
        isCrypto = false
        positionView2.backgroundColor = .systemBackground
        positionView.backgroundColor = .systemBlue
        tableView.reloadData()
    }
    @objc private func didtapCrypto(){
        isCrypto = true
        positionView.backgroundColor = .systemBackground
        positionView2.backgroundColor = .systemBlue
        tableView.reloadData()
    }
    private func callApi(){
        ApiManager.shared.walletList()
        { result in
            switch result {
            case.success(let model):
                DispatchQueue.main.async {
                    self.myWallet = model
                    self.tableView.reloadData()
                }
            case.failure(let error):
                print(error.localizedDescription)
                
            }
        }
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            
            fiatButton.topAnchor.constraint(equalTo: view1.topAnchor),
            fiatButton.leadingAnchor.constraint(equalTo: view1.leadingAnchor),
            fiatButton.trailingAnchor.constraint(equalTo: view1.trailingAnchor),
            fiatButton.heightAnchor.constraint(equalToConstant: 45),
            
            positionView.leadingAnchor.constraint(equalTo: view1.leadingAnchor),
            positionView.trailingAnchor.constraint(equalTo: view1.trailingAnchor),
            positionView.bottomAnchor.constraint(equalTo: view1.bottomAnchor),
            positionView.heightAnchor.constraint(equalToConstant: 3),
            
            cryptoButton.topAnchor.constraint(equalTo: view2.topAnchor),
            cryptoButton.leadingAnchor.constraint(equalTo: view2.leadingAnchor),
            cryptoButton.trailingAnchor.constraint(equalTo: view2.trailingAnchor),
            cryptoButton.heightAnchor.constraint(equalToConstant: 45),
            
            positionView2.leadingAnchor.constraint(equalTo: view2.leadingAnchor),
            positionView2.trailingAnchor.constraint(equalTo: view2.trailingAnchor),
            positionView2.bottomAnchor.constraint(equalTo: view2.bottomAnchor),
            positionView2.heightAnchor.constraint(equalToConstant: 3),
            
            tableView.topAnchor.constraint(equalTo: stackView.bottomAnchor,constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
        ])
    }
}
extension AddNewViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !isCrypto{
            return myWallet?.fiatWallets.count ?? 0
        }else{
            return myWallet?.cryptoWallets.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "WalletTableViewCell", for: indexPath) as! WalletTableViewCell
        if !isCrypto{
            cell.configureFiat(fWallet: (myWallet?.fiatWallets[indexPath.row])!)
        }else{
            cell.configureCrypto(cWallet: (myWallet?.cryptoWallets[indexPath.row])!)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = WalletDetailsViewController()
        let nav = UINavigationController(rootViewController: vc)
        if !isCrypto {
            guard let list = (myWallet?.fiatWallets[indexPath.row].subwallets) else { return }
                vc.subWallet = list
                vc.priceLabel1.text = String(format: "%.2f",myWallet?.fiatWallets[indexPath.row].balanceText1Value ?? 0.0)
                vc.priceLabel2.text = String(format: "%.2f",myWallet?.fiatWallets[indexPath.row].balanceText2Value ?? 0.0)
            
            
        }else{
            guard let list = (myWallet?.cryptoWallets[indexPath.row].subwallets) else { return }
                vc.subWallet = list
                vc.priceLabel1.text = String(format: "%.2f",myWallet?.cryptoWallets[indexPath.row].balanceText1Value ?? 0.0)
                vc.priceLabel2.text = String(format: "%.2f",myWallet?.cryptoWallets[indexPath.row].balanceText2Value ?? 0.0)
            
        }
        
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true)
    }
    
}
