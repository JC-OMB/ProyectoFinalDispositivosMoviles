//
//  personaSegura.swift
//  ProyectoFinal01
//
//  Created by Jose Gerardo Moran Hernandez on 05/10/21.
//
import Firebase

struct personaSegura: Decodable{
    
    var id:String
    var nombre:String
    var descripcion:String
    
    enum CodingKeys: String, CodingKey {
            case id, nombre
            case descripcion = "desc"
        }

    init(nombre:String, desc:String, id:String){
        self.nombre = nombre
        self.descripcion = desc
        self.id = id
    }
    
    init(id:String, nombre:String, desc:String){
        self.id = id
        self.nombre = nombre
        self.descripcion = desc
        
    }

    init(d:DocumentSnapshot){
        self.id = d.documentID
        self.nombre = d.get("nombre") as? String ?? ""
        self.descripcion = d.get("descripcion") as? String ?? ""
        
    }
    
}

typealias pS = [personaSegura]
