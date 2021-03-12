//
//  ContentView.swift
//  CarCustomizer
//
//  Created by Freddie Nunn on 09/03/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var starterCars = StarterCars()
    @State private var selectedCar: Int = 0
    @State private var exhaustPackage = false
    @State private var tiresPackage = false
    @State private var torquePackage = false
    @State private var godPackage = false
    @State private var remainingFunds = 2000
    @State private var settings = [[false, false, false, false], [false, false, false, false], [false, false, false, false], [false, false, false, false]]
    @State private var money = [2000, 2000, 2000, 2000]
    @State private var remainingTime = 30
    @State private var exhaustPackageDisabled = false
    @State private var tiresPackageDisabled = false
    @State private var torquePackageDisabled = false
    @State private var godPackageDisabled = false
    @State private var nextCarDisabled = false
    var exhaustPackageEnabled: Bool {
        return exhaustPackage ? false : remainingFunds >= 500 ? false : true
    }
    var tiresPackageEnabled: Bool {
        return tiresPackage ? false : remainingFunds >= 500 ? false : true
    }
    var torquePackageEnabled: Bool {
        return torquePackage ? false : remainingFunds >= 500 ? false : true
    }
    var godPackageEnabled: Bool {
        return godPackage ? false : remainingFunds >= 2000 ? false : true
    }
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        let exhaustPackageBinding = Binding<Bool> (
            get: { self.exhaustPackage },
            set: { newValue in
                self.exhaustPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 5
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 5
                    remainingFunds += 500
                    
                }
            }
        )
        let tiresPackagingBinding = Binding<Bool> (
            get: { self.tiresPackage },
            set: { newValue in
                self.tiresPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handling += 2
                    remainingFunds -= 500
                }else{
                    starterCars.cars[selectedCar].handling -= 2
                    remainingFunds += 500
                }
            }
        )
        let torquePackagingBinding = Binding<Bool> (
            get: { self.torquePackage },
            set: { newValue in
                self.torquePackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].acceleration -= 1
                    remainingFunds -= 500
                }else{
                    starterCars.cars[selectedCar].acceleration += 1
                    remainingFunds += 500
                }
            }
        )
        let godPackagingBinding = Binding<Bool> (
            get: { self.godPackage },
            set: { newValue in
                self.godPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].acceleration -= 1.5
                    starterCars.cars[selectedCar].topSpeed += 100
                    starterCars.cars[selectedCar].handling += 5
                    remainingFunds -= 2000
                    
                }else{
                    starterCars.cars[selectedCar].acceleration += 1.5
                    starterCars.cars[selectedCar].topSpeed -= 100
                    starterCars.cars[selectedCar].handling -= 5
                    remainingFunds += 2000
                }
            }
        )
        VStack {
            Text("\(remainingTime)")
                .onReceive(timer, perform: { _ in
                    if self.remainingTime > 0{
                        self.remainingTime -= 1
                    }else{
                        disableAll()
                    }
                })
            Form {
                VStack(alignment: .leading, spacing: 20) {
                    Text(starterCars.cars[selectedCar].statDisplay())
                    Button("Next Car", action: {
                        money[selectedCar] = remainingFunds
                        settings[selectedCar] = [exhaustPackage, tiresPackage, torquePackage, godPackage]
                        if selectedCar == self.starterCars.cars.count-1{
                            selectedCar = 0
                        }else{
                            selectedCar += 1
                        }
                        resetDisplay()
                    })
                    .disabled(nextCarDisabled)
                }
                Section {
                    Toggle("Exhaust package [500G]", isOn: exhaustPackageBinding)
                        .disabled(exhaustPackageEnabled)
                        .disabled(exhaustPackageDisabled)
                    Toggle("Tires package [500G]", isOn: tiresPackagingBinding)
                        .disabled(tiresPackageEnabled)
                        .disabled(tiresPackageDisabled)
                    Toggle("Torque package [500G]", isOn: torquePackagingBinding)
                        .disabled(torquePackageEnabled)
                        .disabled(torquePackageDisabled)
                    Toggle("God package [2000G]", isOn: godPackagingBinding)
                        .disabled(godPackageEnabled)
                        .disabled(godPackageDisabled)
                    .padding()
                }
            }
            Text("Remaining Funds: \(remainingFunds)")
                .foregroundColor(.red)
                .baselineOffset(20)
        }
    }
    
    func disableAll() {
        exhaustPackageDisabled = true
        tiresPackageDisabled = true
        torquePackageDisabled = true
        godPackageDisabled = true
        nextCarDisabled = true
    }
    
    func resetDisplay() {
        exhaustPackage = settings[selectedCar][0]
        tiresPackage = settings[selectedCar][1]
        torquePackage = settings[selectedCar][2]
        godPackage = settings[selectedCar][3]
        remainingFunds = money[selectedCar]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
