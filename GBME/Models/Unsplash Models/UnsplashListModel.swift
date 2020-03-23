//
//  UnsplashListModel.swift
//  GBME
//
//  Created by Jithin James on 3/22/20.
//  Copyright © 2020 Jithin James. All rights reserved.
//

import Foundation

struct User: Codable {
    var id: String?
    var name: String?
    var username: String?
    var bio: String?
    var profile_image: [String: String]?
}

struct UnSplash: Codable {
    var id: String?
    var urls: [String: String]
    var user: User?
}

