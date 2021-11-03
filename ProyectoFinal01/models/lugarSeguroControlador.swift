//
//  lugarSeguroControlador.swift
//  ProyectoFinal01
//
//  Created by Jose Gerardo Moran Hernandez on 05/10/21.
//

import Foundation
class lugarSeguroControlador{
    
    func fetchlugarSeguro(completion: @escaping (Result<lS,Error>)->Void){
        
        var urlComponents = URLComponents(string: "http://martinmolina.com.mx/202113/tc2024/equipo3/lugarSeguro.json")!


        let task = URLSession.shared.dataTask(with: urlComponents.url!) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data{
                do{
                    let lS = try? jsonDecoder.decode([lugarSeguro].self, from: data)
                    completion(.success(lS!))
                }
                catch{
                    completion(.failure(error))
                }
            }
            else {
                completion(.failure(error as! Error))
            }
            
        }

        task.resume()
        
    }
}
