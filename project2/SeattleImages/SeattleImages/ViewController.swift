//
//  ViewController.swift
//  SeattleImages
//
//  Created by 李炳超 on 12/13/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!


    let seattleImages = ["1", "2", "3", "4"]

    override func viewDidLoad() {
        super.viewDidLoad()
        

        tableView.dataSource = self
        tableView.delegate = self

    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seattleImages.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        // 假设图片的原始纵横比是4:3，可以根据您图片的实际比例调整
        let imageAspectRatio: CGFloat = 4.0 / 3.0
        let height = screenWidth / imageAspectRatio
        return height
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)


        let imageName = seattleImages[indexPath.row]
        cell.imageView?.image = UIImage(named: imageName)


        return cell
    }
}

