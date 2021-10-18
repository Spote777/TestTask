//
//  TableViewCell.swift
//  TestTask
//
//  Created by Павел Заруцков on 16.10.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var currency: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var created: UILabel!
    @IBOutlet weak var roundView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configRoundView()
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    private func configRoundView() {
        roundView.layer.cornerRadius = roundView.frame.size.width / 2
        roundView.clipsToBounds = true
        roundView.backgroundColor = .lightGray
    }
    
    func config(model: ModalData) {
        
        currency.text = model.currency
        desc.text = model.desc        
        if let amount = model.amount {
            self.amount.text = "\(amount)"
        }
        if let date = model.created {
            self.created.text = "\(convertDate(dateValue: Double(date)))"
        }
    }
    
}

extension TableViewCell {
    func convertDate(dateValue: Double) -> String {
        let truncatedTime = Double(dateValue / 1000)
        let date = Date(timeIntervalSince1970: TimeInterval(truncatedTime))
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        formatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        return formatter.string(from: date)
    }
}


