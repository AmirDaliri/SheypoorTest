//
//  DescMovieTableViewController.swift
//  SheypoorTest
//
//  Created by i Daliri on 7/28/17.
//  Copyright © 2017 i Daliri. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class DescMovieTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var descTableview: UITableView!
    
    var image: String = ""
    var name: String = ""
    var language: String = ""
    var premiered: String = ""
    var rating: String = ""
    var summary: String = ""
    var updated: String = ""
    
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // I'm Here...
        self.descTableview.delegate = self
        self.descTableview.dataSource = self
        self.getDescMovie()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        log.info(User.getId()!)
    }
    
    
    
    
    // MARK: - TableView DataSource Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "descMovieCell") as! DeskMovieItemViewCell
        if self.image.isEmpty{
            let delay = 2 * Double(NSEC_PER_SEC)
            let time = DispatchTime.now() + Double(Int64(delay)) / Double(NSEC_PER_SEC)
            DispatchQueue.main.asyncAfter(deadline: time) {
                cell.topImage.af_setImage(withURL: URL(string: self.image)!)
            }
        }else {
            cell.topImage.af_setImage(withURL: URL(string: self.image)!)
        }
        cell.name.text = "name:  \(self.name)"
        cell.language.text = "language  \(self.language)"
        cell.premiered.text = "premiered:  \(self.premiered)"
        cell.rating.text = "rating:  \(self.rating)"
        cell.updated.text = "updated:  \(self.updated)"
        cell.summary.text = "summary: \(self.summary)"
        return cell
    }
    
    
    
    // MARK: - Request Methods
    
    func getDescMovie() {
        if !Reachability.connectedToNetwork() {
            Helpers.alertWithTitle(self, title: nil, message: Strings.networkError)
            return
        }
        Helpers.showLoadingHUD(self)
        Alamofire.request(ApiRouter.Router.showWithID(id: User.getId()!)).validate().responseJSON() { (response) in
            if response.result.isSuccess {
                let json = JSON(data: response.data!)
                let image = json["image"]["medium"].stringValue
                let name  = json["name"].stringValue
                let language = json["language"].stringValue
                let premiered = json["premiered"].stringValue
                let rating = json["rating"]["average"].stringValue
                let summary = json["summary"].stringValue
                let updated = json["updated"].stringValue
                
                self.image = image
                self.name = name
                self.language = language
                self.premiered = premiered
                self.rating = rating
                self.updated = updated
                let str = summary.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
                self.summary = str
                
                let timeResult  = updated
                let date = NSDate(timeIntervalSince1970: TimeInterval(timeResult)!)
                let dateFormatter = DateFormatter()
                dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
                dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
                dateFormatter.timeZone = TimeZone.current
                let localDate = dateFormatter.string(from: date as Date)
                self.updated = localDate
                
                self.descTableview.reloadData()
                Helpers.hideLoadingHUD(self)
            } else {
                Helpers.hideLoadingHUD(self)
                Helpers.alertWithTitle(self, title: nil, message: Strings.unknownError)
                log.debug(response)
            }
        }
    }
    
}
