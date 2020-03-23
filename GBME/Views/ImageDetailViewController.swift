//
//  ImageDetailViewController.swift
//  GBME
//
//  Created by Jithin James on 3/22/20.
//  Copyright © 2020 Jithin James. All rights reserved.
//

import UIKit

class ImageDetailViewController: UIViewController {
    var viewModel: ImageDetailViewModel!

    @IBOutlet weak var imageView : UIImageView!
    @IBOutlet weak var userLabel : UILabel!

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = viewModel.imageData.cellImage.image
        userLabel.text = viewModel.imageData.name
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
