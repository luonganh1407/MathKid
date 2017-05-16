//
//  ViewController.swift
//  MathforKid
//
//  Created by Techmaster on 4/26/17.
//  Copyright © 2017 Techmaster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbl_so1: UILabel!
    @IBOutlet weak var lbl_so2: UILabel!
    @IBOutlet weak var lbl_pt: UILabel!
    @IBOutlet weak var btn_kq1: UIButton!
    @IBOutlet weak var btn_kq2: UIButton!
    @IBOutlet weak var btn_kq3: UIButton!
    @IBOutlet weak var lbl_true: UILabel!
    @IBOutlet weak var lbl_fail: UILabel!
    @IBAction func btn_action(_ sender: UIButton) {
        check(sender)
        batdau()
        setrandom()
    }
    @IBOutlet weak var lbl_timer: UILabel!
    var  time: Int!
    var settime: Timer!
    var dung = 0
    var sai = 0
    override func viewDidLoad() {
        super.viewDidLoad()
                                                            //chay thoi gian
        
        settime = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(tgtl), userInfo: nil, repeats: true)
        setrandom()
        batdau()
    }
    func tgtl() { time = time - 1                           // thoi gian tra loi
        
        lbl_timer.text = String(time)
        if time == 0 {
            sai = sai + 1
            lbl_fail.text = String(sai)
            
            batdau()
            setrandom()
        }
        
    }
    
    func batdau(){                                          // thoi gian set random so moi
        time = 5
        
    }
    
    //lay ra 2 so ngay nhien
    func setrandom(){
        var so1 = Int(arc4random_uniform(9) + 1)
        var so2 = Int(arc4random_uniform(9) + 1)
        print("\(so1) \(so2)")
        
        
                                                            //hien thi 2 so ngau nhien
        lbl_so1.text = String(so1)
        lbl_so2.text = String(so2)
        
        
        let pheptinh = Int(arc4random_uniform(4))           //random phep tinh
        if pheptinh == 0 {
            lbl_pt.text = "+"
        }else if pheptinh == 1 {
            lbl_pt.text = "-"
            while (so1 < so2) {
                
                
                so1 = Int(arc4random_uniform(9) + 1)
                so2 = Int(arc4random_uniform(9) + 1)
                lbl_so1.text = String(so1)
                lbl_so2.text = String(so2)
            }
        }else if pheptinh == 2 {
            lbl_pt.text = "*"
        }else {
            lbl_pt.text = "/"
            var sodu = so1 % so2
            while  sodu != 0 {
                so1 = Int(arc4random_uniform(9) + 1)
                so2 = Int(arc4random_uniform(9) + 1)
                sodu = so1%so2
                lbl_so1.text = String(so1)
                lbl_so2.text = String(so2)
            }
        }
        ketqua()
    }
    func check(_ sender: UIButton){                         //check dap an dung +1 sai  +1
    lbl_true.text = String(dung)
    let settong = Int(lbl_so1.text!)! + Int(lbl_so2.text!)!
    let sethieu = Int(lbl_so1.text!)! - Int(lbl_so2.text!)!
    let settich = Int(lbl_so1.text!)! * Int(lbl_so2.text!)!
    let setthuong = Int(lbl_so1.text!)! / Int(lbl_so2.text!)!
    
    
    if settong == (Int(sender.currentTitle!)) || sethieu == (Int(sender.currentTitle!)) || settich == (Int(sender.currentTitle!)) || setthuong == (Int(sender.currentTitle!))
    {
    dung = dung + 1
    lbl_true.text = String(dung)
    
    }else{
    sai = sai + 1
    lbl_fail.text = String(sai)
    
    }
    }                                                       //random vi tri dap an
    func ketqua(){
        var dapan1 = Int(arc4random_uniform(9) + 1)
        var dapan2 = Int(arc4random_uniform(9) + 1)
        let dapan3 = pttu()
        while (dapan1 == dapan2 || dapan2 == dapan3 || dapan1 == dapan3) {
        dapan1 = Int(arc4random_uniform(9) + 1)
        dapan2 = Int(arc4random_uniform(9) + 1)
        }
        let vtkq = Int(arc4random_uniform(3))
        if vtkq == 0 {
            
            
            btn_kq1.setTitle(String(dapan1), for: .normal)
            btn_kq2.setTitle(String(dapan2), for: .normal)
            btn_kq3.setTitle(String(pttu()), for: .normal)
        }
        else  if vtkq == 1 {
            btn_kq1.setTitle(String(dapan1), for: .normal)
            btn_kq3.setTitle(String(dapan2), for: .normal)
            btn_kq2.setTitle(String(pttu()), for: .normal)
        }
        else  {
            btn_kq3.setTitle(String(dapan1), for: .normal)
            btn_kq2.setTitle(String(dapan2), for: .normal)
            btn_kq1.setTitle(String(pttu()), for: .normal)
        
        }
        
                                                        //phep tinh tuong ung
    }
    func pttu() -> Int{
        var dapan = 0
        if lbl_pt.text == "+" {
            dapan = tong(x1: Int(lbl_so1.text!)!, x2: Int(lbl_so2.text!)!)
        }
        else if lbl_pt.text == "-"{
            dapan = hieu(x1: Int(lbl_so1.text!)!, x2: Int(lbl_so2.text!)!)
        }else if lbl_pt.text == "*" {
            dapan = tich(x1: Int(lbl_so1.text!)!, x2: Int(lbl_so2.text!)!)
        }else if
            lbl_pt.text == "/" {
            dapan = thuong(x1: Int(lbl_so1.text!)!, x2: Int(lbl_so2.text!)!)
        }
        return dapan
    }
    
    
    
                                                        // phep tinh
    func tong(x1: Int,x2: Int) -> Int{
        return x1+x2
    }
    func hieu(x1: Int,x2: Int) -> Int{
        return x1-x2
    }
    func tich(x1: Int,x2: Int) -> Int{
        return x1*x2
    }
    func thuong(x1: Int,x2: Int) -> Int{
        return x1/x2
        
    }
}










