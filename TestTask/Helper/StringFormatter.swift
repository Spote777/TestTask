//
//  StringFormatter.swift
//  TestTask
//
//  Created by Павел Заруцков on 18.10.2021.
//

import Foundation

extension String {
    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
}
