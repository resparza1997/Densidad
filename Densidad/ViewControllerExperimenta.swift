//
//  ViewControllerExperimenta.swift
//  Densidad
//
//  Created by Rodrigo Esparza on 3/23/19.
//  Copyright © 2019 Rodrigo Esparza. All rights reserved.
//

import UIKit

class ViewControllerExperimenta: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    //Picker View
    @IBOutlet weak var pvLiquidos: UIPickerView!
    var liquidos = ["Agua", "Agua de mar", "Aceite", "Gasolina", "Alcohol"]
    var densidadesLiquidos = ["1000", "1027", "920", "680", "720"]
    var densidadLiquido : Double!
    
    
    @IBOutlet weak var vistaOpacidad: UIView!
    @IBOutlet weak var gifLiquido: UIImageView!
    
    private lazy var waveView: LCWaveView = {
        let waveView = LCWaveView(frame: CGRect(x: 0, y: 0, width: vistaOpacidad.bounds.size.width , height: 0 ), color: UIColor.black)
        waveView.waveRate = 2
        waveView.waveSpeed = 1
        waveView.waveHeight = 7
        return waveView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        gifLiquido.loadGif(name: "agua fondo")
        waveView.startWave()
        vistaOpacidad.addSubview(waveView)
        vistaOpacidad.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - Picker View
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return liquidos.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
            return liquidos[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        densidadLiquido = Double(densidadesLiquidos[row])
        
        //Agua
        if(row == 0){
            vistaOpacidad.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
            densidadLiquido = Double(densidadesLiquidos[row])
        }
        
        //Agua de mar
        if(row == 1){
            vistaOpacidad.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
            densidadLiquido = Double(densidadesLiquidos[row])
        }
        
        //Aceite
        if(row == 2){
            vistaOpacidad.backgroundColor = UIColor.yellow.withAlphaComponent(0.5)
            densidadLiquido = Double(densidadesLiquidos[row])
        }
        
        //Gasolina
        if(row == 3){
            vistaOpacidad.backgroundColor = UIColor(red: 0.898, green: 0.6745, blue: 0, alpha: 0.5) /* #e5ac00 */
            densidadLiquido = Double(densidadesLiquidos[row])
        }
        
        //Alcohol
        if(row == 4){
            vistaOpacidad.backgroundColor = UIColor(red: 0.9882, green: 0.9686, blue: 0.8784, alpha: 0.5) /* #fcf7e0 */
            densidadLiquido = Double(densidadesLiquidos[row])
        }
        
    }
}
