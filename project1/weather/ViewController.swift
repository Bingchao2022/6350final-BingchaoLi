//
//  ViewController.swift
//  weather
//
//  Created by 李炳超 on 12/13/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    
    @IBOutlet var tableView: UITableView!
    var weathers: [Weather] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "WeatherCell")
        tableView.dataSource = self
        fetchWeatherData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weathers.count // `weathers` 是你的天气数据数组
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath)
        let weather = weathers[indexPath.row]

        cell.textLabel?.text = "\(weather.city): \(weather.temperature)°C"
        cell.detailTextLabel?.text = weather.conditions
        return cell
    }
    
    func fetchWeatherData() {
        guard let url = URL(string: "https://us-central1-fir-api-s-8d31b.cloudfunctions.net/app") else { return }

        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let data = data {
                do {
                    let weatherData = try JSONDecoder().decode([Weather].self, from: data)
                    DispatchQueue.main.async {
                        self?.weathers = weatherData
                        self?.tableView.reloadData()
                    }
                } catch {
                    print("解码错误: \(error)")
                }
            } else if let error = error {
                print("网络请求错误: \(error)")
            }
        }.resume()
    }




}

