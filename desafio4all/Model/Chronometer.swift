//
//  Chronometer.swift
//  desafio4all
//
//  Created by Lidiane Gomes Barbosa on 15/12/20.
//

import Foundation
protocol ChronometerDelegate: class {
    func didUpdate()
}
class Chronometer {
    private var hour: Int = 0
    private var minute: Int = 0
    private var second: Int = 0
    private var timer: Timer?
    weak var delegate: ChronometerDelegate?
    var time: String {
        get {
            configureStrTime(hour: hour, min: minute, sec: second)
        }
    }
    
    init() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.second += 1
            if self.second >= 60 {
                self.second = 0
                self.minute += 1
            } else if self.minute > 60 {
                self.hour += 1
            }
            self.delegate?.didUpdate()
        }
        self.hour = 0
        self.minute = 0
        self.second = 0
    }

    func end() {
        timer?.invalidate()
    }
    
    private func configureStrTime(hour: Int, min: Int, sec: Int) -> String {
        var hourStr = String(hour)
        var minuteStr = String(min)
        var SecondStr = String(sec)
        if hour < 10 {
            hourStr = "0\(hour)"
        }
        if min < 10 {
            minuteStr = "0\(min)"
        }
        if sec < 10 {
            SecondStr = "0\(sec)"
        }
        return hourStr + " : " + minuteStr + " : " + SecondStr
    }
}
