//
//  FactsViewModel.swift
//  iOS_CodeAssignment
//
//  Created by Pragati Rode on 05/07/21.
//

import Foundation
import SwiftyJSON


class FactsViewModel {
    weak var vc : ViewController?
    var arrResult = [Rows]()

    func getAllData() {
        URLSession.shared.dataTask(with: URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json")!) { (data, response, error) in
                    
            self.arrResult = []
                    if error == nil {
                        if let data = data
                        {
                            do {
                               
                                let str = String(data: data, encoding: .isoLatin1)
                                let data8 = str?.data(using: .utf8)
                               // let result = try JSONSerialization.jsonObject(with: data8!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                               // print(result)
                                let decoder = JSONDecoder()
                                let factResponse = try decoder.decode(Facts.self, from: data8!)
                                factResponse.rows!.forEach{
                                    self.arrResult.append($0)
                                }
                             
                                DispatchQueue.main.async {
                                    
                                   // self.vc?.tableView.reloadData()
                                }
                    
                            } catch let err{
                                print(String(describing: err)/*err.localizedDescription*/)
                            }
                        }
                    } else {
                        print(error?.localizedDescription ?? "Error")
                    }
                }.resume()
            
    }
}
