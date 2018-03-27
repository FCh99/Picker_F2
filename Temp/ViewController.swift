//
//  ViewController.swift
//  Temp
//
//  Created by Fausto Checa on 27/3/18.
//  Copyright © 2018 Fausto Checa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var outLabel: UILabel!
    
    let diaSemana = ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"]
    
    let tiempo = ["calor", "templado", "frío", "lluvioso"]
    
    var selectedDiaSemana = "Lunes"
    var selectedTiempo = "calor"
    
    enum consejo : String{
        case calor = "lleva manga corta"
        case templado = "lleva camisa de manga larga"
        case frío = "ponte el abrigo y la bufanda"
        case lluvioso = "no se te olvide el paraguas"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
    }
    
    // MARK: - DataSource required methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return 7
        }else if component == 1 {
            return 4
        }
       return 0
    }
   
    // MARK: - Delegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var titulo = ""
        if component == 0 {
            titulo = diaSemana[row]
            return titulo
        }else {
            titulo = tiempo[row]
            return titulo
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            selectedDiaSemana = diaSemana[row]
        } else {
            selectedTiempo = tiempo[row]
        }
        
    }
    
    @IBAction func goButton(_ sender: Any) {
        
        var consejito = ""
        switch selectedTiempo {
        case "calor":
            consejito = consejo.calor.rawValue
        case "frío" :
            consejito = consejo.frío.rawValue
        case "templado":
            consejito = consejo.templado.rawValue
        case "lluvioso":
            consejito = consejo.lluvioso.rawValue
        default:
            print("error al elaborar el consejo")
        }
        
        let string = "El próximo \(selectedDiaSemana) el tiempo será \(selectedTiempo), \(consejito)"
        outLabel.text = string
    }
    
    
    
}

