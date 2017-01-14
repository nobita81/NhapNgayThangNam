//
//  ViewController.swift
//  NhapNgayThangNam
//
//  Created by Dr on 1/2/17.
//  Copyright © 2017 Dr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var lblLabel: UILabel!
 
    @IBOutlet weak var txtNgayThang: UITextField!
    
    @IBAction func atxtCheck(_ sender: Any) {
        if txtNgayThang.text?.characters.count == 10 {
            txtNgayThang.textColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
            btnNgayThang.isHidden = false
            
        } else {
            
            txtNgayThang.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            btnNgayThang.isHidden = true
        }
    }
    
    @IBOutlet weak var btnNgayThang: UIButton!
    
    
    @IBAction func abtnTinh(_ sender: UIButton) {
        
        if let ngaythang = txtNgayThang.text {
            let arrNgayThang:Array<String> = ngaythang.components(separatedBy: "/")
            
            let thu:String = Ngay_Trong_Tuan(iDay: Int(arrNgayThang[0])!, iMonth: Int(arrNgayThang[1])!, iYear: Int(arrNgayThang[2])!)
            
            lblLabel.text = thu
            txtNgayThang.text = ""
            
        }
        
    }
    func Tong_So_Ngay(iDay:Int,iMonth:Int,iYear:Int)-> Int
    {
        var sumdays: Int=0
        let arrNormalMonth:Array<Int>=[31,28,31,30,31,30,31,31,30,31,30,31]
        let arrLeapMonth:Array<Int>=[31,29,31,30,31,30,31,31,30,31,30,31]
        if (iYear%4 == 0)
        {
            //Month289 = 29
            for i in 1 ..< iMonth
            {
                sumdays += arrLeapMonth[i]
            }
            sumdays += iDay
        }
        else
        {
            //Month289 = 28
            for i in 1 ..< iMonth
            {
                sumdays += arrNormalMonth[i]
            }
            sumdays += iDay
        }
        return sumdays
    }
    
    func Ngay_Trong_Tuan(iDay:Int,iMonth:Int,iYear:Int) -> String
    {
        var thu:String=""
        let dicThu:Dictionary<Int,String> = [0:"Chu Nhat",1:"Thu Hai", 2:"Thu Ba",3:"Thu Tu", 4:"Thu Nam", 5:"Thu Sau",6:"Thu Bay"]
        let tong_ngay = Tong_So_Ngay(iDay: iDay, iMonth: iMonth, iYear: iYear)
        let ret = (((iYear - 1) + (iYear - 1)/4 - (iYear - 1)/100 + (iYear - 1)/400) + tong_ngay) % 7
        for (key,value) in dicThu
        {
            if (key == ret)
            {
                thu = value
            }
        }
        return thu
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnNgayThang.isHidden = true
        
        lblLabel.textColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        lblLabel.text = "Nhập Nội Dung Vào Ô Dưới"
        lblLabel.numberOfLines = 0
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

