//
//  lugarSeguro.swift
//  ProyectoFinal01
//
// 
//
import Firebase
struct lugarSeguro: Decodable{
    var id:String
    var direccion:String
    
//    enum CodingKeys: String, CodingKey {
//            case direccion = "direcc"
//            //case descripcion = "desc"
//        }

    init(id:String, direccion:String){
        self.id=id
        self.direccion = direccion
        //self.descripcion = desc
    }
    
    init(d:DocumentSnapshot){
        self.id = d.documentID
        self.direccion = d.get("direccion") as? String ?? ""
           }
}

typealias lS = [lugarSeguro]

