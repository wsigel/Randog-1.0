//
//  ViewController.swift
//  Randog-1.0
//
//  Created by Wolfgang Sigel on 29.03.20.
//  Copyright © 2020 Wolfgang Sigel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let randomImageEndpoint = DogAPI.Endpoint.randomImageFromAllDogsCollection.url
        let task = URLSession.shared.dataTask(with: randomImageEndpoint) { (data, response, error) in
            guard let data = data else {
                return
            }
            print(data)
            
            // using JSONSerialization
//            do {
//                let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
//                let url = json["message"] as! String
//                print(url)
//            }
//            catch {
//                print(error)
//            }
            
            // using Codable => prefered modern way
            let decoder = JSONDecoder()
            let imageData = try! decoder.decode(DogImage.self, from: data)
            print(imageData)
            guard let imageURL = URL(string: imageData.message) else {
                return
            }
            let task = URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
                guard let data = data else {
                    return
                }
                let downloadedImage = UIImage(data: data)
                DispatchQueue.main.async {
                    self.imageView.image = downloadedImage
                }
            }
            task.resume()
        }
        task.resume()
    }


}

