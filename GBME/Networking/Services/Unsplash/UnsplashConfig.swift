//
//  UnsplashConfig.swift
//  GBME
//
//  Created by Jithin James on 3/21/20.
//  Copyright © 2020 Jithin James. All rights reserved.
//


import Foundation

enum UnsplashConfig:  ServiceProtocol {
    
    case list
    case detail(imageId: String)
    
    var baseURL: URL {
        return URL(string: "https://api.unsplash.com/")!
    }
    
    var path: String {
        switch self {
        case .list:
            return "photos"
        case .detail:
            return ""
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var task: Task {
        switch self {
        case .list:
            let parameters = ["client_id": "8DSX1LXBl0vZo0A32cCrFg13rc0Q_T0yQskFegB_Y_g","page":"1"]
            return .requestParameters(parameters)

        case let .detail(imageId):
            let parameters = ["id": imageId]
            return .requestParameters(parameters)
        }
    }
    
    var headers: Headers? {
        return nil
    }
    
    var parametersEncoding: ParametersEncoding {
        return .url
    }
}

