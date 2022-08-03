//
//  ViewController.swift
//  acceptPaymentDemo
//
//  Created by cqlios on 31/01/21.
//  Copyright © 2021 cqlios. All rights reserved.
//

import UIKit
import AcceptSDK


class ViewController: UIViewController {
    
    // Replace this string with your payment key
    let KEY: String = "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SjFjMlZ5WDJsa0lqb3pNU3dpYjNKa1pYSWlPbnNpWkdWc2FYWmxjbmxmYm1WbFpHVmtJanBtWVd4elpTd2lZVzF2ZFc1MFgyTmxiblJ6SWpveE1EQXNJbU4xY25KbGJtTjVJam9pUlVkUUlpd2lhWFJsYlhNaU9sdGRmU3dpWTNWeWNtVnVZM2tpT2lKRlIxQWlMQ0pwYm5SbFozSmhkR2x2Ymw5cFpDSTZOVGMyTWl3aWJHOWphMTl2Y21SbGNsOTNhR1Z1WDNCaGFXUWlPbVpoYkhObExDSndiV3RmYVhBaU9pSXhOVFl1TWpFMUxqRTNOeTR4TWpNaUxDSmlhV3hzYVc1blgyUmhkR0VpT25zaVptbHljM1JmYm1GdFpTSTZJa05zYVdabWIzSmtJaXdpYkdGemRGOXVZVzFsSWpvaVRtbGpiMnhoY3lJc0luTjBjbVZsZENJNklrVjBhR0Z1SUV4aGJtUWlMQ0ppZFdsc1pHbHVaeUk2SWpnd01qZ2lMQ0ptYkc5dmNpSTZJalF5SWl3aVlYQmhjblJ0Wlc1MElqb2lPREF6SWl3aVkybDBlU0k2SWtwaGMydHZiSE5yYVdKMWNtZG9JaXdpYzNSaGRHVWlPaUpWZEdGb0lpd2lZMjkxYm5SeWVTSTZJa05TSWl3aVpXMWhhV3dpT2lKamJHRjFaR1YwZEdVd09VQmxlR0V1WTI5dElpd2ljR2h2Ym1WZmJuVnRZbVZ5SWpvaUt6ZzJLRGdwT1RFek5USXhNRFE0TnlJc0luQnZjM1JoYkY5amIyUmxJam9pTURFNE9UZ2lMQ0psZUhSeVlWOWtaWE5qY21sd2RHbHZiaUk2SWs1QkluMHNJbUZ0YjNWdWRGOWpaVzUwY3lJNk1UQXdmUS5OVmFuOU5IUXM3NWowb2g4LTNaYkU0QkhLY05Jb0RkQmlJbGpiWUs3UUptMDZqN3VTX0dTVGpaeUtONElWem1JajktUEhFak5GdnluNEFhOUkzb1p5Zw=="

    // Place your billing data here
    // billing data can not be empty
    // if empty, type in NA instead
    let bData = [  "apartment": "tertertretr",
                   "email": "kumarbhavnish96@gmail.com",
                   "floor": "sd3543534",
                   "first_name": "ertert",
                   "street": "sdfdsf",
                   "building": "erterte",
                   "phone_number": "8360353581",
                   "shipping_method": "hjdsfhsdf",
                   "postal_code": "3454345",
                   "city": "sdfsdfdfsd",
                   "country": "fsfsdfsfs",
                   "last_name": "sdfdsfdsf",
                   "state": "fsdfdsf"
    ]

    
    
    
    
    
let accept = AcceptSDK()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        accept.delegate = self
        
        
    }

    @IBAction func payNow(_ sender: Any) {
        
        do {
            try accept.presentPayVC(vC: self, billingData: bData, paymentKey: KEY, saveCardDefault:
            true, showSaveCard: true, showAlerts: true)
        } catch AcceptSDKError.MissingArgumentError(let errorMessage) {
            print(errorMessage)
        }  catch let error {
            print(error.localizedDescription)
        }

        
        
        
    }
    
}


extension ViewController:AcceptSDKDelegate {
    func userDidCancel() {
        print("user canceled")
    }
    
    func paymentAttemptFailed(_ error: AcceptSDKError, detailedDescription: String) {
        
        
        
    }
    
    func transactionRejected(_ payData: PayResponse) {
       print(payData)
    }
    
    func transactionAccepted(_ payData: PayResponse) {
        print(payData)
    }
    
    func transactionAccepted(_ payData: PayResponse, savedCardData: SaveCardResponse) {
       
        print(payData)
    }
    
    func userDidCancel3dSecurePayment(_ pendingPayData: PayResponse) {
        print(pendingPayData.integration_id)
    }
    
    
    
    
}

