//
//  personaSeguraTableViewController.swift
//  ProyectoFinal01
//
//  Created by Jose Gerardo Moran Hernandez on 04/10/21.
//

import UIKit
import Firebase

class personaSeguraTableViewController: UITableViewController {
    
    let db = Firestore.firestore()
    
    var datos = [personaSegura]()
    var PersonaSeguraControlador = personaSeguraControlador()
    
    override func viewDidAppear(_ animated: Bool) {
        PersonaSeguraControlador.fetchPersonaSegura{ (resultado) in
            switch resultado{
            case .success(let listaPersonaSegura):self.updateGUI(listaPersonaSegura: listaPersonaSegura)
            case .failure(let error):self.displayError(e: error)
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        PersonaSeguraControlador.fetchPersonaSegura{ (resultado) in
            switch resultado{
            case .success(let listaPersonaSegura):self.updateGUI(listaPersonaSegura: listaPersonaSegura)
            case .failure(let error):self.displayError(e: error)
            }
            
        }
    }
    
    func updateGUI(listaPersonaSegura: pS){
        DispatchQueue.main.async {
            self.datos = listaPersonaSegura
            self.tableView.reloadData()
        }
    }
        
    func displayError(e:Error){
        DispatchQueue.main.async {
            let alerta =  UIAlertController(title: "Error de conexion", message: e.localizedDescription, preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: "Cerrar", style: .default, handler: nil))
            self.present(alerta, animated: true, completion: nil)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return datos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "zelda", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = datos[indexPath.row].nombre
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let siguiente = segue.destination as! detallePersonaSeguraViewController
        let indice = self.tableView.indexPathForSelectedRow?.row
        siguiente.personaSeg = datos[indice!]
    }
    
    @IBAction func insertarContacto(_ sender: UIBarButtonItem) {
        let siguienteVista = storyboard!.instantiateViewController(withIdentifier: "insertarContacto")
        siguienteVista.modalPresentationStyle = .fullScreen
        self.present(siguienteVista, animated:true, completion:nil)    }
    
    @IBAction func editarTabla(_ sender: UIBarButtonItem) {
        let modoEdicion = tableView.isEditing
        tableView.setEditing(!modoEdicion, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            PersonaSeguraControlador.deletePersona(registroID: datos[indexPath.row].id){ (resultado) in
                switch resultado{
                case .success(let retorno): self.viewDidAppear(true)
                case .failure(let error):self.displayError(e: error)
                }
                
            }
            
        }
    }
    
    func updateUI(){
        
      PersonaSeguraControlador.fetchPersonaSegura{ (resultado) in
            switch resultado{
            case .success(let listaPersonaSegura):self.updateGUI(listaPersonaSegura: listaPersonaSegura)
            case .failure(let error):self.displayError(e: error)
            }
    }
    }
    
    func displayError(_ error: Error, title: String) {
            DispatchQueue.main.async {
                let alert = UIAlertController(title: title, message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }}
