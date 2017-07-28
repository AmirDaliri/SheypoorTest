//
//  ViewController.swift
//  SheypoorTest
//
//  Created by i Daliri on 7/28/17.
//  Copyright © 2017 i Daliri. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire
import SwiftyJSON

class ListMovieTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var tableview: UITableView!
    
    let showDescIdentifire = "showDescVC"
    var array: [(id: Int, name: String, image: String)] = []
    
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // I'm Here...
        self.getSchedule()
        self.tableview.delegate = self
        self.tableview.dataSource = self
    }
    
    
    // MARK: - TableView DataSource Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as! MvovieItemViewCell
        cell.nameItem.text = array[indexPath.row].name
        cell.imageItem.af_setImage(withURL: URL(string: array[indexPath.row].image)!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id = (array[indexPath.row].id)
        User.setId(id: id)
        self.performSegue(withIdentifier: self.showDescIdentifire, sender: self)
    }
    
    
    // MARK: - Request Methods
    
    func getSchedule() {
        if !Reachability.connectedToNetwork() {
            Helpers.alertWithTitle(self, title: nil, message: Strings.networkError)
            return
        }
        Helpers.showLoadingHUD(self)
        Alamofire.request(ApiRouter.Router.fullSchedule()).validate().responseJSON() { (response) in
            if response.result.isSuccess {
                let json = JSON(data: response.data!)
                for item in json.arrayValue {
                    self.array.append((id: item["id"].intValue, name: item["name"].stringValue, image: item["image"]["medium"].stringValue))
                    log.info(self.array)
                }
                self.tableview.reloadData()
                Helpers.hideLoadingHUD(self)
            } else {
                Helpers.hideLoadingHUD(self)
                Helpers.alertWithTitle(self, title: nil, message: Strings.unknownError)
                log.debug(response)
            }
        }
    }
    
    
}

