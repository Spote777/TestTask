//
//  AlertView.swift
//  TestTask
//
//  Created by Павел Заруцков on 18.10.2021.
//

import UIKit

extension UIViewController {
    func showAlert(title : String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
}

