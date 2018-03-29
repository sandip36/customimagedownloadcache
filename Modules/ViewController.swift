//
//  ViewController.swift
//  Custom Demo
//
//  Created by Semantic on 29/03/18.
//  Copyright © 2018 Sandip Jadhav. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    
//=========================== Variable Initializations ===========================
    @IBOutlet weak var segmentController    : UISegmentedControl!
    @IBOutlet weak var mapView              : MKMapView!
    @IBOutlet weak var tableView            : UITableView!
    @IBOutlet weak var activityIndicator    : UIActivityIndicatorView!
                   var dataArray            :[Crimes] = []
    
    
    
//MARK: =========================== View Life Cycles ===========================
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateViewAtStart()
       
        self.downloadDataFromService("http://trasquare.com/traveller_api/checktrawellersgatewayurl.php?action=getMyActivity&userId=85&page=1")
        
        let nib1 = UINib(nibName: "SampleTableViewCell", bundle: nil)
        tableView.register(nib1, forCellReuseIdentifier: "cell")
        self.tableView.estimatedRowHeight = 44 ;
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
  
    
//Mark: =========================== Update View At Startup ===========================
    func updateViewAtStart() {
        self.mapView.isHidden   = true
        self.tableView.isHidden = true
        self.activityIndicator.isHidden = false
        self.segmentController.isHidden = true
    }

    
//MARK: =========================== Segment Method ===========================
    @IBAction func segmentChanged(_ sender: Any) {
        if self.segmentController.selectedSegmentIndex == 0 {
            self.mapView.isHidden   = false
            self.tableView.isHidden = true
        }else{
            self.mapView.isHidden   = true
            self.tableView.isHidden = false
        }
    }

//MARK:===========================  Download Data from Service ===========================
    func downloadDataFromService(_ urlString : String){
        if Reachability.isConnectedToNetwork() == true {
            
            let url : URL = URL(string: urlString)!
            let request = URLRequest(url: url as URL)
            let session = URLSession(configuration: URLSessionConfiguration.default)
            let task = session.dataTask(with: request, completionHandler: {(data, response, error) -> Void in
                if let data = data {
                    let json = try? JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
                    if let response = response as? HTTPURLResponse , 200...299 ~= response.statusCode {
                        
                        let crimes = json?["data"] as! [[String:Any]]
                        
                        for obj in crimes{
                            
                        let crime = Crimes()
                        crime.cdid = obj["userImage"] as? String
                        crime.type = obj["posted_by"] as? String
                        crime.date = obj["activity_description"] as? String
                        crime.address = obj["activity_type"] as? String
                        crime.link = obj["total_comments"] as? String
                        crime.lat = obj["is_my"] as? Double
                        crime.lon = obj["totalRatings"] as? Double
                        self.dataArray.append(crime)
                        }
                        //                        self.mapView.isHidden   = true
//                        self.tableView.isHidden = false
                        print(self.dataArray)
                    self.updateMapAndTableview()
                        
                    } else {
                        self.updateMapAndTableview()
                        self.showAlert("Data not fetched from server")
                    }
                }
            })
            
            task.resume()
        }else{
           // self.updateMapAndTableview()
            self.showAlert("Device internet is not Working")
        }

    }
    
 
//MARK: =========================== Update MapView & TableView ===========================
    func updateMapAndTableview(){
        
        DispatchQueue.main.async {
       
        var annotationArray : [CustomPointAnnotation] = []
        
//        for obj in self.dataArray{
//
//        let annotation  = CustomPointAnnotation()
//        annotation.coordinate = CLLocationCoordinate2DMake(obj.lat!,obj.lon!)
//
//            switch obj.type! {
//            case "Assault":
//                annotation.imageName = #imageLiteral(resourceName: "icon_assault")
//                break ;
//            case "Theft":
//                annotation.imageName = #imageLiteral(resourceName: "icon_theft")
//                break ;
//            case "Burglary":
//                annotation.imageName = #imageLiteral(resourceName: "icon_burglary")
//                break ;
//            case "Vandalism":
//                annotation.imageName = #imageLiteral(resourceName: "icon_vandalism")
//                break ;
//            case "Robbery":
//                annotation.imageName = #imageLiteral(resourceName: "icon_robbery")
//                break ;
//            default:
//                break ;
//            }
//
//        annotation.title = obj.address
//        annotationArray.append(annotation)
//        }
        
//            // to set zoom level of Map
//            if self.dataArray.count > 0 {
//                let crime = self.dataArray[0]
//                let span = MKCoordinateSpanMake(0.075, 0.075)
//                let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: crime.lat!, longitude: crime.lon!), span: span)
//                self.mapView.setRegion(region, animated: true)
//            }
//
            
    //    self.mapView.addAnnotations(annotationArray)
        self.tableView.reloadData()
            
            self.mapView.isHidden   = true
            self.tableView.isHidden = false
            self.activityIndicator.isHidden = true
            self.segmentController.isHidden = false
            
        }
        
        
        
    }
    
    
//Mark: =========================== Show Alert ===========================
    func showAlert(_ message:String){
        
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "No Internet", message: message, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .cancel) { (action:UIAlertAction!) in
            }
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true, completion:nil)
            
        }
        
    }
}





// MARK:=========================== Tableview Delegates & Data Sources===========================
extension ViewController : UITableViewDelegate , UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SampleTableViewCell
        
        let crime = self.dataArray[indexPath.row] as Crimes
        
        cell.imgview.loadImageUsingCache(withUrl: crime.cdid!)
        cell.lblname.text = crime.date

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}










//MARK : =========================== MAPVIEW Delegates ===========================
extension ViewController : MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if !(annotation is CustomPointAnnotation) {
            return nil
        }
        
        let reuseId = "Location"
        
        var anView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
        if anView == nil {
            anView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            anView!.canShowCallout = true
        }
        else {
            anView!.annotation = annotation
        }
        let cpa = annotation as! CustomPointAnnotation
        anView!.image = cpa.imageName
        
        return anView
    }
    
    
    
}





//MARK: =========================== Model Class For Crimes===========================
class Crimes {
    var cdid: String?
    var type: String?
    var date: String?
    var address: String?
    var link: String?
    var lat: Double?
    var lon: Double?
}
extension UIImageView {
    func loadImageUsingCache(withUrl urlString : String) {
        let url = URL(string: urlString)
        self.image = nil
        
        // check cached image
        if let cachedImage = imageCache.object(forKey: urlString as NSString) as? UIImage {
            self.image = cachedImage
            return
        }
        
        // if not, download image from url
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    imageCache.setObject(image, forKey: urlString as NSString)
                    self.image = image
                }
            }
            
        }).resume()
    }
}



//{
//    let urlstring :URL=URL(string:"http://trasquare.com/traveller_api/checktrawellersgatewayurl.php?action=getMyActivity&userId=85&page=1")!
//    
//    var newDict = [String:String]()
//    
//    Alamofire.request(urlstring).response{ response in // method defaults to `.get`
//        
//        if let status = response.response?.statusCode {
//            switch(status){
//            case 200:
//                print("example success")
//                do {
//                    let json = try JSON(data: response.data!)
//                    print(json)
//                    for item in json["data"] as! [[String:AnyObject]] {
//                        newDict["activity_description"] = item["activity_description"] as? String
//                        //                        newDict["title"] = item["title"] as? String
//                        //                        newDict["publishedDate"] = item["published"] as? String
//                        //                        newDict["author"] = item["displayName"] as? String
//                        item.append(newDict)
//                    }
//                } catch {
//                    print(error)
//                    // or display a dialog
//                }
//                
//            default:
//                print("error with response status: \(status)")
//            }
//        }
//        print(newDict)
//        //          if response.data != nil {
//        //        do {
//        //            if let data = response.data,
//        //                let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
//        //              let blogs = json["data"] as? [[String: Any]] {
//        //                print(blogs)
//        ////                for blog in blogs {
//        ////                    if let name = blog["name"] as? String {
//        ////                        names.append(name)
//        ////                    }
//        ////                }
//        //          }
//        //        } catch {
//        //            print("Error deserializing JSON: \(error)")
//        //        }
//        //
//        //        }
//        //        if response.data != nil {
//        //
//        //
//        //            let json = JSON(data: response.data!)
//        //            let name = json["people"][0]["name"]
//        //            if name != nil {
//        //                print(name!)
//        //                }
//        //
//        //        }
//        
//    }
//    
//    
//    //  }
//}

