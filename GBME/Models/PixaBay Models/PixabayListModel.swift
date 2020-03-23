//
//  PixabayListModel.swift
//  GBME
//
//  Created by Jithin James on 3/22/20.
//  Copyright © 2020 Jithin James. All rights reserved.
//

import Foundation

struct PixaBay: Decodable {
    let hits: [PixabayImage]
}

struct PixabayImage: Decodable {
    let user: String
    let largeImageURL: String?
}
