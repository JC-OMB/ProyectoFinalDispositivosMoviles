//
//  lugarSeguro.swift
//  ProyectoFinal01
//
// 
//
import Firebase
struct lugarSeguro: Decodable{
    var direccion:String
    
    enum CodingKeys: String, CodingKey {
            case direccion = "direcc"
            //case descripcion = "desc"
        }

    init(direccion:String, desc:String){
        self.direccion = direccion
        //self.descripcion = desc
    }
    
    init(d:DocumentSnapshot){
        self.direccion = d.get("direccion") as? String ?? ""
    }
}

typealias lS = [lugarSeguro]

