//
//  PixabayService.swift
//  GBME
//
//  Created by Jithin James on 3/21/20.
//  Copyright © 2020 Jithin James. All rights reserved.
//

import Foundation

enum PixabayConfig:  ServiceProtocol {
    
    case list
    case detail
    
    var baseURL: URL {
        return URL(string: "https://pixabay.com/api/")!
    }
    
    var path: String {
        switch self {
        case .list:
            return ""
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
            let parameters = ["key": "15684811-5dedc7bb45cf663d390bacbb6","image_type":"photo"]
            return .requestParameters(parameters)

        case .detail:
            let parameters = ["":""]
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
