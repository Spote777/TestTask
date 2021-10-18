//
//  ViewController.swift
//  TestTask
//
//  Created by Павел Заруцков on 16.10.2021.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var loginTxtFld: UITextField!
    @IBOutlet weak var passwordTxtFld: UITextField!
    
    var token:String = ""
    let network = Network()
    let myGroup = DispatchGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        token = ""
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        DispatchQueue.main.async {
            self.getToken()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, qos: .background) {
            if self.token != "" {
                DispatchQueue.main.async {
                    let storyboard = UIStoryboard(name: "Main", bundle:nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "TableViewController") as! TableViewController
                    vc.token = self.token
                    let navController = UINavigationController(rootViewController: vc)
                    navController.modalPresentationStyle = .fullScreen
                    self.present(navController, animated: true, completion: nil)
                }
              
            } else {
                DispatchQueue.main.async {
                    self.showAlert(title: "Error!", message: "Autorization error")
                }
            }
        }
    }
    
    private func getToken () {
        guard let login = loginTxtFld.text, let password = passwordTxtFld.text else {return}
        network.getToken(login, password) { [weak self] result in
            DispatchQueue.main.async {
                self?.token = result.response.token
            }
        }
    }
}
