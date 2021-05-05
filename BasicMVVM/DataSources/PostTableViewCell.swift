//
//  PostTableViewCell.swift
//  BasicMVVM
//
//  Created by artjoms.vorona on 05/05/2021.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    let cellIdentifier = "PostTableViewCell"
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var body: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func nib() -> UINib {
        return UINib(nibName: cellIdentifier, bundle: nil)
    }
    
}
