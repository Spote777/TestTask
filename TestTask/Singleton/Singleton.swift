//
//  Singleton.swift
//  TestTask
//
//  Created by Павел Заруцков on 18.10.2021.
//

import Foundation

final class Session {
    
    static let instance = Session()
    private init() {}
    
    var token: String?
   
}
