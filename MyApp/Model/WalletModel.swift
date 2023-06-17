//
//  WalletModel.swift
//  MyApp
//
//  Created by Sanil on 17/06/23.
//

import Foundation

struct WalletModel: Codable {
    let status: Bool
    let message, errors: String?
    let inApp: Bool
    let webURL, externalWeburl: String?
    let section: Int
    let fiatWallets: [FiatWallet]
    let cryptoWallets: [Wallet]

    enum CodingKeys: String, CodingKey {
        case status, message, errors
        case inApp = "in_app"
        case webURL = "web_url"
        case externalWeburl = "external_weburl"
        case section
        case fiatWallets = "fiat_wallets"
        case cryptoWallets = "crypto_wallets"
    }
}
struct Wallet: Codable {
    let id: Int
    let name: String
    let parentID: Int?
    let status: Int
    let currencyImage: String?
    let currencySymbol: String
    let icon: String
    let walletType: Int
    let highlightText: String?
    let balanceText1: String
    let balanceText1Value: Double
    let balanceText2: String
    let balanceText2Value: Double
    let clickEnabled, inApp: Bool
    let webURL, externalWeburl: String?
    let section: Int
    let crypto: Bool
    let actions: [Action]?
    let subwallets: [Wallet]?
    let depositAddress: String?
    let depositAddressQr: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case parentID = "parent_id"
        case status
        case currencyImage = "currency_image"
        case currencySymbol = "currency_symbol"
        case icon
        case walletType = "wallet_type"
        case highlightText = "highlight_text"
        case balanceText1 = "balance_text1"
        case balanceText1Value = "balance_text1_value"
        case balanceText2 = "balance_text2"
        case balanceText2Value = "balance_text2_value"
        case clickEnabled = "click_enabled"
        case inApp = "in_app"
        case webURL = "web_url"
        case externalWeburl = "external_weburl"
        case section, crypto, actions, subwallets
        case depositAddress = "deposit_address"
        case depositAddressQr = "deposit_address_qr"
    }
}
struct Action: Codable {
    let id: Int
    let name: String
    let url: String?
    let inApp: Bool?

    enum CodingKeys: String, CodingKey {
        case id, name, url
        case inApp = "in_app"
    }
}
struct FiatWallet: Codable {
    let id: Int
    let name: String
    let parentID: String?
    let status: Int
    let currencyImage: String?
    let currencySymbol: String
    let icon: String
    let walletType: Int
    let highlightText: String?
    let balanceText1: String
    let balanceText1Value: Double
    let balanceText2: String
    let balanceText2Value: Double
    let clickEnabled, inApp: Bool
    let webURL, externalWeburl: String?
    let section: Int
    let crypto: Bool
    let subwallets: [Wallet]?
    let actions: [Action]?
    let approvedBalance: Double?
    let pendingBalance: Int?
    let approvedBalanaceText, pendingBalanaceText: String?
    let depositAddress, depositAddressQr, currencyCode: String?
    let accountNumber, sortCode: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case parentID = "parent_id"
        case status
        case currencyImage = "currency_image"
        case currencySymbol = "currency_symbol"
        case icon
        case walletType = "wallet_type"
        case highlightText = "highlight_text"
        case balanceText1 = "balance_text1"
        case balanceText1Value = "balance_text1_value"
        case balanceText2 = "balance_text2"
        case balanceText2Value = "balance_text2_value"
        case clickEnabled = "click_enabled"
        case inApp = "in_app"
        case webURL = "web_url"
        case externalWeburl = "external_weburl"
        case section, crypto, subwallets, actions
        case approvedBalance = "approved_balance"
        case pendingBalance = "pending_balance"
        case approvedBalanaceText = "approved_balanace_text"
        case pendingBalanaceText = "pending_balanace_text"
        case depositAddress = "deposit_address"
        case depositAddressQr = "deposit_address_qr"
        case currencyCode = "currency_code"
        case accountNumber, sortCode
    }
}
