//
//  WalletTableViewCell.swift
//  MyApp
//
//  Created by Sanil on 17/06/23.
//

import UIKit
import SDWebImage
class WalletTableViewCell: UITableViewCell {
    static let identifier = "WalletTableViewCell"
    let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let headerImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.image = UIImage(systemName: "dollarsign.circle.fill")
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let iconImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.clipsToBounds = true
        image.image = UIImage(systemName: "arrow.right")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceLabel1: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let priceLabel2: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 12, weight: .regular)
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
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(headerView)
        headerView.addSubview(headerImageView)
        headerView.addSubview(iconImageView)
        headerView.addSubview(titleLabel)
        headerView.addSubview(stackView)
        stackView.addArrangedSubview(priceLabel1)
        stackView.addArrangedSubview(priceLabel2)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            headerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 100),
            
            headerImageView.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            headerImageView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 15),
            headerImageView.heightAnchor.constraint(equalToConstant: 25),
            headerImageView.widthAnchor.constraint(equalToConstant: 25),
            
            titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: headerImageView.trailingAnchor, constant: 10),
            titleLabel.widthAnchor.constraint(equalToConstant: 120),
            
            stackView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor,constant: 15),
            stackView.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -15),
            stackView.widthAnchor.constraint(equalToConstant: 100),
            
            iconImageView.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            iconImageView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10),
            iconImageView.heightAnchor.constraint(equalToConstant: 25),
            iconImageView.widthAnchor.constraint(equalToConstant: 25),
            
        ])
    }
   func configureFiat(fWallet : FiatWallet){
       if let image = fWallet.currencyImage {
           headerImageView.sd_setImage(with: URL(string: image))
       }
       titleLabel.text = fWallet.name
        priceLabel1.text = String(format: "%.2f",fWallet.balanceText1Value)
        priceLabel2.text = String(format: "%.2f",fWallet.balanceText2Value)
        
    }
    func configureCrypto(cWallet : Wallet){
        if let image = cWallet.currencyImage {
            headerImageView.sd_setImage(with: URL(string: image))
        }
         titleLabel.text = cWallet.name
         priceLabel1.text = String(format: "%.2f",cWallet.balanceText1Value)
         priceLabel2.text = String(format: "%.2f",cWallet.balanceText2Value)
         
     }
    func configureSub(subWallet : Wallet){
        if let image = subWallet.currencyImage {
            headerImageView.sd_setImage(with: URL(string: image))
        }
         titleLabel.text = subWallet.name
         priceLabel1.text = String(format: "%.2f",subWallet.balanceText1Value)
         priceLabel2.text = String(format: "%.2f",subWallet.balanceText2Value)
         
     }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
