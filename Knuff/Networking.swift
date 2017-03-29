//
//  Networking.swift
//  Knuff
//
//  Created by Detar Zyberi on 17.08.16.
//  Copyright © 2016 Bowtie. All rights reserved.
//

import Cocoa

class Networking {
    
    internal static func sendPushNotification(_ url: URL, key: String, body: Data) {
        
        
        // Start the request
        var request = URLRequest(url: url)
        
        // Set the HTTP Header Content Type and Authorisation
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("key=\(key)", forHTTPHeaderField: "Authorization")
        
        // Add the Body Data and set the Method to POST
        request.httpBody = body
        request.httpMethod = "POST"
        
        // Transfer the Session into the DataTask and check if all the data is correct
        let dataTask = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            print(data as Any)
            print(response as Any)
            print(error as Any)
            
            // Get the respone for the StatusCode
            if let httpResponse = response as? HTTPURLResponse {
                
                print("statusCode: \(httpResponse.statusCode)")
                
                DispatchQueue.main.async(execute: { 
                    // Create an Alert Message to show the Status Code, so the user can see if it works
                    let alert = NSAlert()
                    alert.messageText = "Status Code: \(httpResponse.statusCode)"
                    alert.alertStyle = NSAlertStyle.informational
                    
                    // run the message
                    alert.runModal()
                })
                
            }

        })
        
        
        // Send the Data
        dataTask.resume()
        
    }

}
