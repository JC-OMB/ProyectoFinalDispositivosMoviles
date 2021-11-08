//
//  lugarSeguroTableViewController.swift
//  ProyectoFinal01
//
//
//

import UIKit
import Firebase
import FirebaseFirestore // <-------
class lugarSeguroTableViewController: UITableViewController, UISearchResultsUpdating {
    let db = Firestore.firestore()
    var datos = [lugarSeguro]()
    var LugarSeguroControlador = lugarSeguroControlador()
    var datosFiltrados = [lugarSeguro]()
    let searchController = UISearchController(searchResultsController: nil)
    func updateSearchResults(for searchController: UISearchController) {
        
        // si la caja de búsuqeda es vacía, entonces mostrar todos los resultados
        if searchController.searchBar.text! == "" {
            datosFiltrados = datos
        } else {
            // Filtrar los resultados de acuerdo al texto escrito en la caja que es obtenido a través del parámetro $0
            //$0 es un objeto tipo Raza
            datosFiltrados = datos.filter{
                let s:String = $0.direccion
                return(s.lowercased().contains(searchController.searchBar.text!.lowercased())) }
        }
        
        self.tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        LugarSeguroControlador.fetchlugarSeguro{ (resultado) in
            switch resultado{
            case .success(let listaLugarSeguro):self.updateGUI(listaLugarSeguro: listaLugarSeguro)
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
        LugarSeguroControlador.fetchlugarSeguro{ (resultado) in
            switch resultado{
            case .success(let listaLugarSeguro):self.updateGUI(listaLugarSeguro: listaLugarSeguro)
            case .failure(let error):self.displayError(e: error)
            }
        }
        //Paso 6: usar la vista actual para presentar los resultados de la búsqueda
        searchController.searchResultsUpdater = self
        //paso 7: controlar el background de los datos al momento de hacer la búsqueda
        searchController.dimsBackgroundDuringPresentation = false
        //Paso 8: manejar la barra de navegación durante la busuqeda
        searchController.hidesNavigationBarDuringPresentation = false
        //Paso 9: Instalar la barra de búsqueda en la cabecera de la tabla
        tableView.tableHeaderView = searchController.searchBar
        
    }
    //update de la base de datos
    func updateGUI(listaLugarSeguro: lS){
        DispatchQueue.main.async {
            self.datos = listaLugarSeguro
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "zelda2", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = datos[indexPath.row].direccion
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
        let siguiente = segue.destination as! detalleLugarSeguroViewController
        let indice = self.tableView.indexPathForSelectedRow?.row
        siguiente.lugarSeg = datosFiltrados[indice!]
    }
    
    //permitira insertar una nueva ubicacion segura a nuestra base de datos
    @IBAction func insertarLugarSeguro(_ sender: UIBarButtonItem){
        let siguienteVista = storyboard!.instantiateViewController(withIdentifier: "insertarLugarSeguro")
        siguienteVista.modalPresentationStyle = .fullScreen
        self.present(siguienteVista, animated:true, completion:nil)
    }
    //nos permitira editar nuestra tabla
    @IBAction func editarTabla(_ sender: UIBarButtonItem) {
        let modoEdicion = tableView.isEditing
        tableView.setEditing(!modoEdicion, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //Aqui estaba el problema para borrado, estaba utilizando el datosFiltrados y debia ser solamente datos
            LugarSeguroControlador.deleteUbicacion(registroID: datos[indexPath.row].id){ (resultado) in
                switch resultado{
                case .success(let retorno): self.updateUI()//self.viewDidAppear(true)
                case .failure(let error):self.displayError(e: error)
                }
                
            }
            
        }
    }
    
    //update UI
    func updateUI(){
        
        LugarSeguroControlador.fetchlugarSeguro{ (resultado) in
            switch resultado{
            case .success(let listaLugarSeguro):self.updateGUI(listaLugarSeguro: listaLugarSeguro)
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
        }
    
}
