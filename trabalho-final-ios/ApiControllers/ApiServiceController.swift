//
//  ApiServiceController.swift
//  trabalho-final-ios
//
//  Created by HC2MAC19 on 19/11/2019.
//  Copyright © 2019 Thiago Mustafa. All rights reserved.
//

import Foundation

class ApiServiceController {
    func Get(url: String) -> ApiObjectReturn {
        var jsonResult = ApiObjectReturn()

        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
               jsonResult.jsonResult = json
            } catch {
                print("error")
            }
        })
        
        task.resume()
    }
}
