//
//  ImageListViewModel.swift
//  GBME
//
//  Created by Jithin James on 3/19/20.
//  Copyright © 2020 Jithin James. All rights reserved.
//

import Foundation


class ImageListViewModel {
    let imageService: ServiceLayer
    let array = Observable<[RowViewModel]>(value: [])
    
    init(socialService: ServiceLayer = ServiceLayer(type: ApiType.unsplash)) {
        self.imageService = socialService
    }
    
    func initiateSetup() {
        imageService.getListImages(complete: {data in
            self.buildViewModels(dataArray: data)
        })
    }
    
    
    // MARK: - Data source
    
    /// build current model  with wrapperMode
    func buildViewModels(dataArray: [ModelProtocol]) {
        var sectionTable = [RowViewModel]()
        var vm: RowViewModel?
        for item in dataArray {
            if let memberFeed = item as? WrapperListModel {
                let Image = AsyncImage(url: memberFeed.ImageUrl!)
                let listCellViewModel: ListCellViewModel = ListCellViewModel(name: (memberFeed.name)!,image: Image)
                
 /// butoon action if need for the cell eg : like button or follow
//                profileVM.cellPressed = {
//                }
                vm = listCellViewModel
            }
            if let vm = vm {
                sectionTable.append(vm)
            }
        }
        self.array.value = sectionTable
    }
    
    func cellIdentifier(for viewModel: RowViewModel) -> String {
        switch viewModel {
        case is ListCellViewModel:
            return PhotoCell.cellIdentifier()
        default:
            fatalError("Unexpected view model type: \(viewModel)")
        }
    }
    
}
