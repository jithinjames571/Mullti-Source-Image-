//
//  NetworkEnums.swift
//  GBME
//
//  Created by Jithin James on 3/21/20.
//  Copyright © 2020 Jithin James. All rights reserved.
//

enum ParametersEncoding {
    case url
    case json
}

enum NetworkResponse<T> {
    case success(T)
    case failure(NetworkError)
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

typealias Parameters = [String: Any]

enum Task {
    case requestPlain
    case requestParameters(Parameters)
}

enum NetworkError {
    case unknown
    case noJSONData
}
