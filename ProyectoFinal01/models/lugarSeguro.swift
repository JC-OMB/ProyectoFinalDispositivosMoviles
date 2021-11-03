//
//  lugarSeguro.swift
//  ProyectoFinal01
//
//  Created by Jose Gerardo Moran Hernandez on 05/10/21.
//

struct lugarSeguro: Decodable{
    var direccion:String
    //var descripcion:String
    
    enum CodingKeys: String, CodingKey {
            case direccion
            //case descripcion = "desc"
        }

    init(direccion:String, desc:String){
        self.direccion = direccion
        //self.descripcion = desc
    }
}

typealias lS = [lugarSeguro]

