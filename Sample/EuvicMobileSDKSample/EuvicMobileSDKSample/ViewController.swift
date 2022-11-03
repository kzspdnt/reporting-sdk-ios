//
//  ViewController.swift
//  EuvicMobileSDKSample
//
//  Created by Kamil Modzelewski on 30/08/2022.
//

import UIKit
import EuvicMobileSDK
import SafariServices

class ViewController: UIViewController {
    private var custom: [String: Any] {
        [
            "first": (1...10).randomElement(),
            "second": "some text",
            "third": true
        ].compactMapValues { $0 }
    }

    @IBAction func homePageEvent() {
        EuvicMobile.shared.homepageVisitedEvent(custom: custom)
    }
    
    @IBAction func productBrowsedEvent() {
        let product = EuvicMobileProduct(id: "1", price: "23.00", quantity: 3)
        EuvicMobile.shared.productBrowsedEvent(product: product, custom: custom)
    }
    
    @IBAction func productAddedEvent() {
        let product = EuvicMobileProduct(id: "1", price: "23.00", quantity: 3)
        EuvicMobile.shared.productAddedEvent(product: product, custom: custom)
    }
    
    @IBAction func productRemovedEvent() {
        let product = EuvicMobileProduct(id: "1", price: "23.00", quantity: 3)
        EuvicMobile.shared.productRemovedEvent(product: product, custom: custom)
    }
    
    @IBAction func browsedCategoryEvent() {
        let product = EuvicMobileProduct(id: "1", price: "23.00", quantity: 3)
        EuvicMobile.shared.browsedCategoryEvent(name: "Category 1", products: [product], custom: custom)
    }
    
    @IBAction func cartEvent() {
        let product1 = EuvicMobileProduct(id: "1", price: "23.00", quantity: 3)
        let product2 = EuvicMobileProduct(id: "2", price: "99.99", quantity: 1)
        EuvicMobile.shared.cartEvent(products: [product1, product2], custom: custom)
    }
    
    @IBAction func orderStartedEvent() {
        EuvicMobile.shared.orderStartedEvent(custom: custom)
    }
    
    @IBAction func productsOrderedEvent() {
        let product1 = EuvicMobileProduct(id: "1", price: "23.00", quantity: 3)
        let product2 = EuvicMobileProduct(id: "2", price: "99.99", quantity: 1)
        EuvicMobile.shared.productsOrderedEvent(orderId: "order-id", saleValue: "122.99", products: [product1, product2], custom: custom)
    }
    
    @IBAction func showAd() {
        let userId = EuvicMobile.shared.currentUserId
        let userIdEncoded = Data(userId.utf8).base64EncodedString()
        guard let url = URL(string: "https://static.clickonometrics.pl/previews/campaignsPreview.html?key=\(Consts.apiKey)&user_id=\(userIdEncoded)&user_type=IDFA") else {
            return
        }
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
}

