//
//  lugarSeguroControlador.swift
//  ProyectoFinal01
//

//

import Foundation
import Firebase
class lugarSeguroControlador{
    let db = Firestore.firestore()
    
    func fetchlugarSeguro(completion: @escaping (Result<[lugarSeguro],Error>)->Void){
        
        var lista_direcciones = [lugarSeguro]()


       
        db.collection("lugaresSeguros").getDocuments() { (querySnapshot, err) in
            if let err = err{
                print("Error getting documents: \(err)")
                completion(.failure(err))
            }
            else {
                for document in querySnapshot!.documents {
                    var dir = lugarSeguro(d: document)
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
