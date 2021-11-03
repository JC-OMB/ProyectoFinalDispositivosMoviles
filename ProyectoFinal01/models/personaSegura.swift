//
//  personaSegura.swift
//  ProyectoFinal01
//
//  Created by Jose Gerardo Moran Hernandez on 05/10/21.
//

struct personaSegura: Decodable{
    var nombre:String
    //var descripcion:String
    
    enum CodingKeys: String, CodingKey {
            case nombre
            //case descripcion = "desc"
        }

    init(nombre:String, desc:String){
        self.nombre = nombre
        //self.descripcion = desc
    }
}

typealias pS = [personaSegura]
