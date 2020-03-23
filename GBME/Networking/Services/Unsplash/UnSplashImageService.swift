//
//  UnSplashImageService.swift
//  GBME
//
//  Created by Jithin James on 3/21/20.
//  Copyright © 2020 Jithin James. All rights reserved.
//


import Foundation
class UnSplashImageService : ImageServiceProt {
    let sessionProvider = URLSessionProvider()
    
    
    func getListImages(complete: @escaping ([ModelProtocol]?,NetworkError?) -> Void){
        
        self.sessionProvider.request(type: [UnSplash].self, service: UnsplashConfig.list) { response in
            switch response {
            case let .success(posts):
                //print(posts)
                var table = [ModelProtocol]()
                for item in posts{
                    let cellModel = WrapperListModel(unsplashListModel: item)
                    table.append(cellModel)
                }
                DispatchQueue.main.async {
                    complete(table,nil)
                }
            case let .failure(error):
               // print(error)
                DispatchQueue.main.async {
                    complete(nil,error)
                }
            }
        }
    }

}
