//
//  ImageService.swift
//  GBME
//
//  Created by Jithin James on 3/21/20.
//  Copyright © 2020 Jithin James. All rights reserved.
//

import Foundation

enum ApiType{
    case unsplash
    case pixaBay
}


protocol ImageServiceProt {
    func getListImages(complete: @escaping ([ModelProtocol]?,NetworkError?) -> Void)
}

/// This service provides interfaces of communication to server.
class ServiceLayer {
    var apiTypes : ApiType
    var imageService : ImageServiceProt

    init(type: ApiType = ApiType.unsplash) {
        switch type {
        case .pixaBay:
            imageService = PixabayImageService()
        case .unsplash:
            imageService = UnSplashImageService()
        }
        apiTypes = type
    }
    
    func getListImages(complete: @escaping ([ModelProtocol]) -> Void){
        imageService.getListImages(complete: {result,error  in
            complete(result!)
        })
    }
    
}

  


