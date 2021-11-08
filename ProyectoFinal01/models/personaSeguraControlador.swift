//
//  personaSeguraControlador.swift
//  ProyectoFinal01
//
//  Created by Jose Gerardo Moran Hernandez on 05/10/21.
//

import Foundation
import Firebase
class personaSeguraControlador{
    
    let db = Firestore.firestore()
    
    /*
    func fetchPersonaSegura(completion: @escaping (Result<pS,Error>)->Void){
        
        var urlComponents = URLComponents(string: "http://martinmolina.com.mx/202113/tc2024/equipo3/personaSegura.json")!


        let task = URLSession.shared.dataTask(with: urlComponents.url!) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data{
                do{
                    let pS = try? jsonDecoder.decode([personaSegura].self, from: data)
                    completion(.success(pS!))
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
        
    }*/
    
    func fetchPersonaSegura(completion: @escaping (Result<pS,Error>)->Void){
        
        var lista_contactos =  [personaSegura]()
        
        db.collection("contactosSeguros").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                completion(.failure(err))
            } else {
                for document in querySnapshot!.documents {
                    var r = personaSegura(d: document)
                    lista_contactos.append(r)
                }
                completion(.success(lista_contactos))
            }
        }
    }
    
    func updatePersona(personaActualizada: personaSegura, completion: @escaping (Result<String,Error>)->Void){
        db.collection("contactosSeguros").document(personaActualizada.id).updateData(["descripcion":personaActualizada.descripcion]){ err in
            if let err = err {
                completion(.failure(err))
            } else {
                completion(.success("Su registro ha sido modificado con éxito"))
                
            }
        }
    }
    
    func deletePersona(registroID:String, completion: @escaping (Result<String, Error>) -> Void){
           
           db.collection("contactosSeguros").document(registroID).delete() { err in
               if let err = err {
                   print("Error removing document: \(err)")
                   completion(.failure(err))
               } else {
                   print("Document successfully removed!")
                   completion(.success("Document successfully removed!"))
               }
           }
       }
       
       func insertPersona(nuevaPersona:personaSegura, completion: @escaping (Result<String, Error>) -> Void){
           
           var ref: DocumentReference? = nil
           ref = db.collection("contactosSeguros").addDocument(data: [
               "nombre": nuevaPersona.nombre,
               "descripcion": nuevaPersona.descripcion
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
