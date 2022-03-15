//
//  DataController.swift
//  Cake List
//
//  Created by Dave on 15/03/2022.
//

import Foundation


class DataController: ObservableObject {
    
    static var shared = DataController()
    
    @Published var cakes: [Cake] = []
    
    
    // download cake list
    
    func getCakes() {
        if let url = URL(string: "https://gist.githubusercontent.com/hart88/198f29ec5114a3ec3460/raw/8dd19a88f9b8d24c23d9960f3300d0c917a4f07c/cake.json") {
            
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let webData = data {
                    if let json = try?
                        JSONSerialization.jsonObject(with: webData, options: []) as? [[String:String]]{
                        
                        var downloadedCakes: [Cake] = []
                        
                        for jsonSession in json {
                            let cake = Cake()
                            
                            cake.id = UUID().uuidString
                            
                            if let title = jsonSession["title"]{
                                cake.title = title
                            }
                            
                            if let desc = jsonSession["desc"]{
                                cake.desc = desc
                            }
                            
                            if let image = jsonSession["image"]{
                                cake.image = image
                            }
                            
                            downloadedCakes.append(cake)
                            
                        } // FOR JSONSESSION
                        
                        DispatchQueue.main.async {
                            self.cakes = downloadedCakes
                            self.saveCakes()
                        } // DISPATCHQUEUE
                    } // IF LET JSON
                } // IF LET WEBDATA
            } // URLSESSION
            .resume()
        } // IF LET URL
    } // GETCAKES

    // save cake list in UserDefaults
    
    func saveCakes() {
        
        DispatchQueue.global().async {
            if let defaults = UserDefaults(suiteName: "group.dev.daveellis.cakelist") {
                let encoder = JSONEncoder()
                if let encoded = try?
                    encoder.encode(self.cakes) {
                    defaults.set(encoded, forKey: "cakes")
//                    defaults.synchronize()
                } // ENCODER
            } // IF LET DEFAUKTS
        } // DISPATCHQUEUE
    } // SAVE CAKEAs

    // load cake list from UserDefaults
    
    func loadCakes() {
        
        DispatchQueue.global().async {
            if let defaults = UserDefaults(suiteName: "group.dev.daveellis.cakelist") {
                if let data = defaults.data(forKey: "cakes"){
                    let decoder = JSONDecoder()
                    if let jsonCakes = try?
                        decoder.decode([Cake].self, from: data) {
                        DispatchQueue.main.async {
                            self.cakes = jsonCakes
                        } // DISPATCHQUEUE
                    } // DECODER
                } // IF LET DATA
            } // IFLET DEFAULTS
        } // DISPATCHQUEUE
    } // LOAD CAKES
}


