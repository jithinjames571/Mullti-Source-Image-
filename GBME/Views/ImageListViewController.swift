//
//  ViewController.swift
//  GBME
//
//  Created by Jithin James on 3/19/20.
//  Copyright © 2020 Jithin James. All rights reserved.
//

import UIKit


class ImageListViewController: UIViewController {
    @IBOutlet weak var tableView : UITableView!
    var viewModel: ImageListViewModel = ImageListViewModel()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        bind()
        viewModel.initiateSetup()

    }

    func bind() {
        viewModel.array.addObserver(fireNow: true) { [weak self] (array) in
            self?.tableView.reloadData()
        }

    }

}

extension ImageListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  viewModel.array.value.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowViewModel = viewModel.array.value[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellIdentifier(for: rowViewModel), for: indexPath)

        if let cell = cell as? CellConfigurable {
            cell.setup(viewModel: rowViewModel)
        }

        cell.layoutIfNeeded()
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         if let row = viewModel.array.value[indexPath.row] as? RowViewModel {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                   let controller = storyboard.instantiateViewController(withIdentifier: "ImageDetailViewController") as! ImageDetailViewController
            controller.viewModel = ImageDetailViewModel(imgData: row as! ListCellViewModel)
                   self.present(controller, animated: true, completion: nil)
        }
        

        
//       if let row = viewModel.array.value[indexPath.row] as? ViewModelPressible {
//           row.cellPressed?()
//        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return UITableView.automaticDimension

     }

//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view = SectionHeaderView()
//        let sectionViewModel = viewModel.sectionViewModels.value[section]
//        view.setTitle(sectionViewModel.headerTitle)
//        return view
//    }
}


