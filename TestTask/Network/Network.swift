//
//  Network.swift
//  TestTask
//
//  Created by Павел Заруцков on 18.10.2021.
//

import UIKit
import Alamofire

class Network {
    
    let baseUrl = "http://82.202.204.94/api-test"
    
    func getToken(_ login: String, _ password: String, completion: @escaping(ResponseToken)-> ()) {
        
        let params = ["login": login, "password":password]
        
        let head: HTTPHeaders = [
            "app-key":"12345",
            "v":"1"
        ]
        
        guard let baseUrl = URL(string:baseUrl + "/login") else {return}
        AF.request(baseUrl, method: .post, parameters: params, headers: head).responseJSON { (response) in
            switch response.result {
            case .success:
                guard let data = response.data else {return}
                guard let item = try? JSONDecoder().decode(ResponseToken.self, from: data) else {
                    print("Empty Data something wrong")
                    return
                }
                DispatchQueue.main.async {
                    completion(item)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    func getDataInfo(token:String, completion: @escaping(ResponseData) -> ()) {
        guard let url = URL(string: baseUrl + "/payments") else {return}
        
        let head: HTTPHeaders = [
            "app-key":"12345",
            "v":"1"
        ]
        
        let params: Parameters = ["token":token]
        
        AF.request(url, method: .get, parameters: params, headers: head).responseJSON { (response) in
            switch response.result {
            case .success:
                guard let data = response.data else {return}
                guard let item = try? JSONDecoder().decode(ResponseData.self, from: data) else {
                    print("Empty Data something wrong")
                    return
                }
                DispatchQueue.main.async {
                    completion(item)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
