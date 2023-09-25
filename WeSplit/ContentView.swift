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
    
    let tipPercentages = [10,15,20,25,0]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
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
                } header: {
                    Text("How much Tip do you want to leave?")
                }
                
                Section {
                    Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
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
