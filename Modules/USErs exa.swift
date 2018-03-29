//
//  USErs exa.swift
//  Custom Demo
//
//  Created by Semantic on 29/03/18.
//  Copyright © 2018 Sandip.jadhav. All rights reserved.
//

import UIKit

class USErs_exa: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        let data: [String: String] = ["MobileNo" : arrofStr[1],"Groupchildsrno": arrofStr[2],"Oegrpbasinfsrno": arrofStr[3],"Groupcode": arrofStr[4], "Tpacode":arrofStr[5], "Employeesrno":arrofStr[6], "Employeeid":arrofStr[7], "Policyno": arrofStr[8], "Policycommdt":arrofStr[9], "Policyvalidupto":arrofStr[10], "Inscoformname": arrofStr[11], "UserName": arrofStr[12], "Gender": arrofStr[13],"AppStatus":arrofStr[0] ]
//        let maindic : [String: Any] = ["data" : data]
//        UserData.saveUserDict(maindic)
        
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//        //
//        //  UserData.swift
//        //  MyBenefits
//        //
//        //  Created by Application support on 22/05/17.
//        //  Copyright © 2017 SandipJAdhav. All rights reserved.
//        //
//
//        import UIKit
//
//
//        extension Dictionary {
//            mutating func update(other:Dictionary) {
//                for (key,value) in other {
//                    self.updateValue(value, forKey:key)
//                }
//            }
//        }
//        class UserData: NSObject {
//            //MARK:- Existing File Path
//            class func filePath() -> String {
//
//                let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
//
//                let documentDirectory = paths[0] as! String
//
//                let path = documentDirectory.appending("UserData.plist")
//                // let writePath = documentDirectory.stringByAppendingPathComponent("AppConstantPlist.plist")
//
//                // let fileManager = FileManager.default
//
//
//
//                let bundlePath = Bundle.main.path(forResource: "UserData", ofType: ".plist")
//                //print(bundlePath!, "\n") //prints the correct path
//                let destPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
//                let fileManager = FileManager.default
//                let fullDestPath = NSURL(fileURLWithPath: destPath).appendingPathComponent("UserData.plist")
//                let fullDestPathString = fullDestPath?.path
//                print(fileManager.fileExists(atPath: bundlePath!)) // prints true
//                do
//                {
//                    try fileManager.copyItem(atPath: bundlePath!, toPath: fullDestPathString!)
//                    print("DB Copied")
//                }
//                catch
//                {
//                    print("\n")
//                    // print(error)
//                }
//
//                return fullDestPathString!
//                //         if(!fileManager.fileExists(atPath: path))
//                //         {
//                //          do{
//                //
//                //        let bundlePath = Bundle.main.path(forResource: "AppConstantPlist", ofType: "plist")
//                //           try fileManager.copyItem(atPath: bundlePath!, toPath: path)
//                //        }catch{
//                //            print("copy failure.")
//                //        }
//                //        }else
//                //         {
//                //             print("copy failure.")
//                //
//                //        }
//                //        return path
//                //
//            }
//
//
//            //MARK:- Save Plist Data
//
//            class func saveUserDict(_ fromServiceDict: [String: Any])
//
//            {
//
//
//
//                do {
//                    let data = try? JSONSerialization.data(withJSONObject: fromServiceDict, options: .prettyPrinted)
//
//
//                    let json = try? JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
//
//                    let plistDict = NSMutableDictionary(contentsOfFile: self.filePath())
//
//                    let userDict = json?["data"] as! NSDictionary
//
//
//
//
//                    //
//                    //                plistDict?["AppStatus"] = userDict.value(forKey: "successvariable")
//                    //
//                    //                plistDict?["Employeeid"] = userDict.value(forKey: "employeeidentificationno")
//                    //
//                    //                plistDict?["Employeesrno"] =   userDict.value(forKey: "employeesrno")
//                    //
//                    //                plistDict?["Gender"] = userDict.value(forKey: "gender")
//                    //
//                    //                plistDict?["Groupchildsrno"] = userDict.value(forKey: "groupchildsrno")
//                    //
//                    //                plistDict?["Groupcode"] = userDict.value(forKey: "groupcode")
//                    //
//                    //                plistDict?["Inscoformname"] =   userDict.value(forKey: "insurancecompanyformname")
//                    //
//                    //                plistDict?["MobileNo"] = userDict.value(forKey: "mobilenumber")
//                    //
//                    //                plistDict?["Oegrpbasinfsrno"] = userDict.value(forKey: "oegrpbasinfsrno")
//                    //
//                    //                plistDict?["Policyno"] = userDict.value(forKey: "policynumber")
//                    //
//                    //                plistDict?["Policycommdt"] =   userDict.value(forKey: "policycommencementdate")
//                    //
//                    //                plistDict?["Policyvalidupto"] = userDict.value(forKey: "policyvalidupotodate")
//                    //
//                    //                plistDict?["Tpacode"] = userDict.value(forKey: "tpacode")
//                    //
//                    //                plistDict?["UserName"] = userDict.value(forKey: "employeename")
//
//
//                    // print("userDictionary print\(userDict)")
//
//
//                    plistDict?["AppStatus"] = userDict.value(forKey: "AppStatus")
//
//                    plistDict?["Employeeid"] = userDict.value(forKey: "Employeeid")
//
//                    plistDict?["Employeesrno"] =   userDict.value(forKey: "Employeesrno")
//
//                    plistDict?["Gender"] = userDict.value(forKey: "Gender")
//
//                    plistDict?["Groupchildsrno"] = userDict.value(forKey: "Groupchildsrno")
//
//                    plistDict?["Groupcode"] = userDict.value(forKey: "Groupcode")
//
//                    plistDict?["Inscoformname"] =   userDict.value(forKey: "Inscoformname")
//
//                    plistDict?["MobileNo"] = userDict.value(forKey: "MobileNo")
//
//                    plistDict?["Oegrpbasinfsrno"] = userDict.value(forKey: "Oegrpbasinfsrno")
//
//                    plistDict?["Policyno"] = userDict.value(forKey: "Policyno")
//
//                    plistDict?["Policycommdt"] =   userDict.value(forKey: "Policycommdt")
//
//                    plistDict?["Policyvalidupto"] = userDict.value(forKey: "Policyvalidupto")
//
//                    plistDict?["Tpacode"] = userDict.value(forKey: "Tpacode")
//
//                    plistDict?["UserName"] = userDict.value(forKey: "UserName")
//
//                    plistDict?["Yes"] = userDict.value(forKey: "UserLoggedIn")
//
//
//                    // [plistDict setObject: @"Yes" forKey:@"UserLoggedIn"];
//
//                    plistDict?.write(toFile: self.filePath(), atomically: true)
//
//
//                }
//            }
//
//            //MARK:- ==========================================Setter method ========================================
//
//
//            static  func setNotificationCount(_ count: String) {
//                let plistDict = NSDictionary(contentsOfFile: self.filePath())
//
//                plistDict?.setValue(count, forKey: "NotificationCount")
//                plistDict?.write(toFile: filePath(), atomically: true)
//
//            }
//
//
//
//            static  func setNotificationDict(_ dict: [String: Any])
//            {
//                let plistDict = NSDictionary(contentsOfFile: self.filePath())
//
//                plistDict?.setValue(dict, forKey: "NotificationDict")
//                plistDict?.write(toFile: filePath(), atomically: true)
//
//            }
//            static func setAppStatus(_ Appstaus: String) {
//                let plistDict = NSDictionary(contentsOfFile: self.filePath())
//
//                plistDict?.setValue(Appstaus, forKey: "AppStatus")
//                plistDict?.write(toFile: filePath(), atomically: true)    }
//
//
//            static func setDeviceTokenId(_ DeviceTokenId: String) {
//                let plistDict = NSDictionary(contentsOfFile: self.filePath())
//
//                plistDict?.setValue(DeviceTokenId, forKey: "DeviceTokenId")
//                plistDict?.write(toFile: filePath(), atomically: true)    }
//
//
//            static func setUserLoggedIn(_ UserLoggedIn: String) {
//                let plistDict = NSDictionary(contentsOfFile: self.filePath())
//
//                plistDict?.setValue(UserLoggedIn, forKey: "UserLoggedIn")
//                plistDict?.write(toFile: filePath(), atomically: true)    }
//
//
//
//
//            //MARK:- ==========================================Getter method ========================================
//
//            static  func getNotificationCount() -> String {
//
//                let dictRoot = NSDictionary(contentsOfFile: self.filePath())
//                return dictRoot!.value(forKey: "NotificationCount") as! String
//
//            }
//
//
//            static  func getDeviceTokenId()-> String {
//
//                let dictRoot = NSDictionary(contentsOfFile: self.filePath())
//                return dictRoot!.value(forKey: "DeviceTokenId") as! String
//
//            }
//
//
//            static  func getUserLoggedIn()-> String {
//
//                let dictRoot = NSDictionary(contentsOfFile: self.filePath())
//                return dictRoot!.value(forKey: "UserLoggedIn") as! String
//
//            }
//
//
//
//
//
//            //MARK:-Getting AppStatus
//            static func getAppStatus()-> String
//            {
//
//                let dictRoot = NSDictionary(contentsOfFile: self.filePath())
//
//                return dictRoot!.value(forKey: "AppStatus") as! String
//            }
//
//
//            //MARK:- getting values of Employeeid
//            static func getEmployeeid() -> String
//            {
//                let dictRoot = NSDictionary(contentsOfFile: self.filePath())
//
//                return dictRoot!.value(forKey: "Employeeid") as! String
//            }
//
//            //MARK:- getting values of
//
//            static func getEmployeesrno() -> String
//            {
//                let dictRoot = NSDictionary(contentsOfFile: self.filePath())
//
//                return dictRoot!.value(forKey: "Employeesrno") as! String
//            }
//
//            //MARK:- getting values of
//            static func getPolicyno() -> String
//            {
//                let dictRoot = NSDictionary(contentsOfFile: self.filePath())
//
//                return dictRoot!.value(forKey: "Policyno") as! String
//            }
//            //MARK:- getting values of
//            static func getGender() -> String
//            {
//                let dictRoot = NSDictionary(contentsOfFile: self.filePath())
//
//                return dictRoot!.value(forKey: "Gender") as! String
//            }
//            //MARK:- getting values of
//            static func getUserName() -> String
//            {
//                let dictRoot = NSDictionary(contentsOfFile: self.filePath())
//
//                return dictRoot!.value(forKey: "UserName") as! String
//            }
//            //MARK:- getting values of
//            static func getTpacode() -> String
//            {
//                let dictRoot = NSDictionary(contentsOfFile: self.filePath())
//
//                return dictRoot!.value(forKey: "Tpacode") as! String
//            }
//            //MARK:- getting values of
//            static func getPolicyvalidupto() -> String
//            {
//                let dictRoot = NSDictionary(contentsOfFile: self.filePath())
//
//                return dictRoot!.value(forKey: "Policyvalidupto") as! String
//            }
//            //MARK:- getting values of
//            static func getPolicycommdt() -> String
//            {
//                let dictRoot = NSDictionary(contentsOfFile: self.filePath())
//
//                return dictRoot!.value(forKey: "Policycommdt") as! String
//            }
//            //MARK:- getting values of
//            static func getOegrpbasinfsrno() -> String
//            {
//                let dictRoot = NSDictionary(contentsOfFile: self.filePath())
//
//                return dictRoot!.value(forKey: "Oegrpbasinfsrno") as! String
//            }
//            //MARK:- getting values of
//            static func getMobileNo() -> String
//            {
//                let dictRoot = NSDictionary(contentsOfFile: self.filePath())
//
//                return dictRoot!.value(forKey: "MobileNo") as! String
//            }
//            //MARK:- getting values of
//            static func getInscoformname() -> String
//            {
//                let dictRoot = NSDictionary(contentsOfFile: self.filePath())
//
//                return dictRoot!.value(forKey: "Inscoformname") as! String
//            }
//            //MARK:- getting values of
//            static func getGroupcode() -> String
//            {
//                let dictRoot = NSDictionary(contentsOfFile: self.filePath())
//
//                return dictRoot!.value(forKey: "Groupcode") as! String
//            }
//            //MARK:- getting values of
//            static func getGroupchildsrno() -> String
//            {
//                let dictRoot = NSDictionary(contentsOfFile: self.filePath())
//
//                return dictRoot!.value(forKey: "Groupchildsrno") as! String
//            }
//
//
//
//
//        }
//
//    }

}




//var recordKey = "IntimationPerson"
//var dictionaryKeys = ["PERSON_NAME", "PERSON_RELATION", "PERSON_SR_NO", "SORT_ORDER","CLM_INT_COUNT","CLM_INT_CLAIMANT","CLM_INT_COUNT_TEXT","INT_CLM_INTIMATION_DT","INT_CLM_HOSPITAL","INT_CLM_DOA_LIKELYDOA","INT_CLM_CLAIM_AMOUNT","INT_CLM_DIAGNOSIS_OR_AILMENT","IntimateError","INT_CLM_INTIMATION_NO"]
//var results: [[String: String]] = [[:]]        // the whole array of dictionaries
//var currentDictionary: [String: String]! // the current dictionary
//var currentValue: String?

//
//extension MyIntimationsViewController: XMLParserDelegate
//{
//    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
//        if elementName == recordKey {
//            self.currentDictionary = [String : String]()
//        } else if dictionaryKeys.contains(elementName) {
//            self.currentValue = String()
//        }
//    }
//
//    func parser(_ parser: XMLParser, foundCharacters string: String) {
//        self.currentValue? += string
//    }
//
//    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
//        if elementName == self.recordKey {
//            self.results.append(self.currentDictionary)
//            self.currentDictionary = nil
//
//        } else if dictionaryKeys.contains(elementName) {
//            self.currentDictionary[elementName] = currentValue
//            self.currentValue = nil
//
//        }
//
//    }
//
//    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
//
//
//        self.currentValue = nil
//        self.currentDictionary.removeAll()
//        self.results.removeAll()
//
//    }
//
//
//}

