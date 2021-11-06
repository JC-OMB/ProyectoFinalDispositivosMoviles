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
    //update de las direcciones
    func updateDirecciones(direccionActualizada: lugarSeguro,completion: @escaping (Result<String,Error>)->Void){
        db.collection("lugaresSeguros").document(direccionActualizada.id).updateData([
                                                                        "ubicacion":direccionActualizada.direccion]){ err in
            if let err = err {
                completion(.failure(err))
            } else{
                completion(.success("Registro modificado"))
            }
            
        }
    }
    
    //borrar las direcciones existentes
    func deleteUbicacion(registroID:String, completion: @escaping (Result<String, Error>) -> Void){
        
        db.collection("lugaresSeguros").document(registroID).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
                completion(.failure(err))
            } else {
                print("Document successfully removed!")
                completion(.success("Document successfully removed!"))
            }
        }
    }
    
    
    //insertar direcciones nuevas
    func insertUbicacion(nuevaUbicacion:lugarSeguro, completion: @escaping (Result<String, Error>) -> Void){
        
        var ref: DocumentReference? = nil
        ref = db.collection("lugaresSeguros").addDocument(data: [
            "direccion": nuevaUbicacion.direccion
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
                completion(.failure(err))
            } else {
                completion(.success("Documento agregado ID: \(ref!.documentID)"))
            }
        }
    }
}
