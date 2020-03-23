//
//  WrapperListModel.swift
//  GBME
//
//  Created by Jithin James on 3/21/20.
//  Copyright © 2020 Jithin James. All rights reserved.
//


import Foundation
protocol ModelProtocol {}

/// This is a wrapper model used to wrap external/ 3rd party models
struct WrapperListModel:ModelProtocol{
       var id: String?
       var ImageUrl: String?
       var name: String?
       var description: String?
   
    init(pixabayListModel:PixabayImage){
        name = pixabayListModel.user
        ImageUrl = pixabayListModel.largeImageURL
    }
    
    init(unsplashListModel:UnSplash){
        ImageUrl = unsplashListModel.urls["regular"]
        id = unsplashListModel.id
        name = unsplashListModel.user?.name
    }
}


