//
//  ContentView.swift
//  WeSplit
//
//  Created by Mahmudul Hasan on 24/9/23.
//

import SwiftUI

struct ContentView: View {
   
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused : Bool
    
    let tipPercentages = [10,15,20,25,0]
    
    var totalPerson: Double {
        //calculate the total per person here
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .number)
            
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Number of People: ", selection: $numberOfPeople) {
                        ForEach (2..<100) {
                            Text("\($0) People")
                        }
                    }
                }
                
                Section {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0 , format: .percent)
                        }
                    } .pickerStyle(.segmented)
                        .toolbar {
                            ToolbarItemGroup(placement: .keyboard) {
                                
                                Spacer()
                            
                                Button("Done") {
                                    amountIsFocused = false
                                }
                            }
                        }
                        
                } header: {
                    Text("How much Tip do you want to leave?")
                }
                
                Section {
                    Text(totalPerson, format: .currency(code: "BDT"))
                }
            } .navigationTitle("WeSplit")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
