//
//  ViewController.swift
//  WeatherApp
//
//  Created by Văn Khánh Vương on 08/06/2023.
//

import UIKit

class ViewController: UIViewController {

    let api = APIService.share
    
    let dateFormatter = DateFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateFormat = "E, MMM, d"
        
        api.getJSON(urlString: "https://api.openweathermap.org/data/3.0/onecall?lat=10.797361&lon=106.753192&exclude=current,minutely,hourly,alerts&appid=119eb11e0bb29c90d6918b304fb1edd1", dataDecodingStrategy: .secondsSince1970) { (result: Result<Forecast, APIService.APIError>) in
            switch result {
            case .success(let forecast):
                for day in forecast.daily {
                    print(self.dateFormatter.string(from: day.dt))
                    
                }
            case .failure(let apiError):
                switch apiError {
                case .error(let err):
                    print(err)
                }
            }
        }
    }


}

