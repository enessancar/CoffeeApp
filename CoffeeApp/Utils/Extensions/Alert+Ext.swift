//
//  Alert+Ext.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 28.10.2023.
//

import UIKit

extension UIViewController {
    func showAlert(title: String,
                   message: String,
                   buttonTitle: String = StringConstants.General.ok,
                   completion: (() -> ())? = nil) {
        
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        
        alertController.view.tintColor = AppColors.ambassadorBlue.color
        alertController.view.layer.cornerRadius = Radius.large.rawValue
        
        let okAction = UIAlertAction(title: buttonTitle, style: .default) { _ in
            completion?()
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

