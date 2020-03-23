//
//  PhotoCell.swift
//  GBME
//
//  Created by Jithin James on 3/21/20.
//  Copyright © 2020 Jithin James. All rights reserved.
//

import Foundation

protocol CellConfigurable {
    func setup(viewModel: RowViewModel)
}

public extension UITableViewCell {
    /// Generated cell identifier derived from class name
    static func cellIdentifier() -> String {
        return String(describing: self)
    }
}

import UIKit
class PhotoCell: UITableViewCell, CellConfigurable {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var coverImageView: UIImageView!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var viewModel: ListCellViewModel?
    
    func setup(viewModel: RowViewModel) {
        guard let viewModel = viewModel as? ListCellViewModel else { return }
        self.viewModel = viewModel
        self.titleLabel.text = viewModel.name
        self.coverImageView.image = viewModel.cellImage.image
        
        
        let dispatchQueue = DispatchQueue(label: "bgImageQueue", qos: .background)
        dispatchQueue.async{
            viewModel.cellImage.startDownload()
            viewModel.cellImage.completeDownload = { [weak self] image in
                DispatchQueue.main.async {
                    self?.coverImageView.image = image
                }
            }
        }
        setNeedsLayout()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        viewModel?.cellImage.completeDownload = nil
    }
    

}
