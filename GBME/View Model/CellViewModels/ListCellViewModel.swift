//
//  ListCellViewModel.swift
//  GBME
//
//  Created by Jithin James on 3/21/20.
//  Copyright © 2020 Jithin James. All rights reserved.
//

import UIKit
protocol RowViewModel {}

/// Conform this protocol to handles user press action
protocol ViewModelPressible {
    var cellPressed: (()->Void)? { get set }
}

class ListCellViewModel: RowViewModel,ViewModelPressible {
    var cellPressed: (() -> Void)?
    
    let name: String
    let cellImage: AsyncImage

    init(name: String,
         image: AsyncImage,
         addBtnPressed: (() -> Void)? = nil) {
        self.name = name
        self.cellImage = image
        
    }
}
