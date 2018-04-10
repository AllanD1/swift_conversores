//
//  ViewController.swift
//  Conversores
//
//  Created by Allan da Silva on 27/03/2018.
//  Copyright © 2018 Allan da Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var valor: UITextField!
    @IBOutlet weak var btUnidade1: UIButton!
    @IBOutlet weak var btUnidade2: UIButton!
    @IBOutlet weak var resultado: UILabel!
    @IBOutlet weak var resultadoUnidade: UILabel!
    @IBOutlet weak var lbUnidade: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showNext(_ sender: UIButton) {
        switch lbUnidade.text! {
            case "Temperatura":
                lbUnidade.text = "Peso"
                btUnidade1.setTitle("Kilograma", for: .normal)
                btUnidade2.setTitle("Libra", for: .normal)
            case "Peso":
                lbUnidade.text = "Moeda"
                btUnidade1.setTitle("Real", for: .normal)
                btUnidade2.setTitle("Dólar", for: .normal)
            case "Moeda":
                lbUnidade.text = "Distância"
                btUnidade1.setTitle("Metros", for: .normal)
                btUnidade2.setTitle("Kilômetros", for: .normal)
            default:
                lbUnidade.text = "Temperatura"
                btUnidade1.setTitle("Celsius", for: .normal)
                btUnidade2.setTitle("Ferenheint", for: .normal)
        }
        converter(nil)
        
    }
    
    @IBAction func converter(_ sender: UIButton?) {
        if let sender = sender{
            if sender == btUnidade1{
                btUnidade2.alpha = 0.5
            }else{
                btUnidade1.alpha = 0.5
            }
            sender.alpha = 1
        }
        
        switch lbUnidade.text! {
            case "Temperatura":
                calcTemperatura()
            case "Peso":
                calcPeso()
            case "Moeda":
                calcMoeda()
            default:
                calcDistancia()
        }
        view.endEditing(true)
        let res = Double(resultado.text!)!
        resultado.text = String(format: "%.2f", res)
    }
    
    func calcTemperatura(){
        guard let temperatura = Double(valor.text!) else {return}
        if btUnidade1.alpha == 1.0 {
            resultadoUnidade.text = "Ferenheint"
            resultado.text = String(temperatura * 1.8 + 32.0)
        }else{
            resultadoUnidade.text = "Celsius"
            resultado.text = String((temperatura - 32.0)/1.8)
        }
    }
    
    func calcPeso(){
         guard let peso = Double(valor.text!) else {return}
        if btUnidade1.alpha == 1.0 {
            resultadoUnidade.text = "Libra"
            resultado.text = String(peso / 2.2046)
        }else{
            resultadoUnidade.text = "Kilograma"
            resultado.text = String(peso * 2.2046)
        }
    }
    
    func calcMoeda(){
        guard let moeda = Double(valor.text!) else {return}
        if btUnidade1.alpha == 1.0 {
            resultadoUnidade.text = "Dólar"
            resultado.text = String(moeda / 3.3)
        }else{
            resultadoUnidade.text = "Real"
            resultado.text = String(moeda * 3.3)
        }
    }
    
    func calcDistancia(){
         guard let distancia = Double(valor.text!) else {return}
        if btUnidade1.alpha == 1.0 {
            resultadoUnidade.text = "Kilômetros"
            resultado.text = String(distancia / 1000.0)
        }else{
            resultadoUnidade.text = "Metros"
            resultado.text = String(distancia * 1000.0)
        }
    }
}








