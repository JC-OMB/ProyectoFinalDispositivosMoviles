//
//  lugarSeguroControlador.swift
//  ProyectoFinal01
//
//  Created by Jose Gerardo Moran Hernandez on 05/10/21.
//

import Foundation
import Firebase
class lugarSeguroControlador{
    let db = Firestore.firestore()
    
    func fetchlugarSeguro(completion: @escaping (Result<[lS],Error>)->Void){
        
        var lista_direcciones = [lS]()


       
        db.collection("lugaresSeguros").getDocuments() { (querySnapshot, err) in
            let jsonDecoder = JSONDecoder()
            if let err = err{
                print("Error getting documents: \(err)")
                completion(.failure(err))
            }
            else {
                for document in querySnapshot!.documents {
                    var dir = lS(d: document)
                    lista_direcciones.append(dir)
            }
                completion(.success(lista_direcciones))
            
        }
        
    }
}
    func updateDirecciones(direccionActualizada: lugarSeguro,completion: @escaping (Result<String,Error>)->Void){
        db.collection("lugaresSeguros").document(direccionActualizada.direccion).updateData([
                                                                        "ubicacion":direccionActualizada.direccion]){ err in
            if let err = err {
                completion(.failure(err))
            } else{
                completion(.success("Registro modificado"))
            }
            
        }
    }
    
}
