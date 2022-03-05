//
//  ViewController.swift
//  ParsingAPI
//
//  Created by Егор Куракин on 02.03.2022.
//

import UIKit

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://icodeschool.ru/json2.php"
        
        guard let url = URL(string: urlString) else { return }
        
        //парсинг JSON по URL
        URLSession.shared.dataTask(with: url) { data, response, error in
            //ввывод ошибки если есть
            if let error = error {
                print(error)
                return
            }
            //сам JSON
            guard let data = data else { return }
            
            //let jsonString = String(data: data, encoding: .utf8)
            //print(jsonString)
            
            
            
            do {
                let decoder = JSONDecoder()
                //настройка формата даты
                let dateFormater = DateFormatter()
                dateFormater.dateFormat = "yyyy-MM-dd HH:mm:ss"
                decoder.dateDecodingStrategy = .formatted(dateFormater)
                //парсим JSON
                let lessons = try decoder.decode([Lesson].self, from: data)
                print(lessons.first?.comments?.first?.user.gender)
            } catch {
                 print(error)
            }
            
            
        }.resume()
    }
    
    

}

