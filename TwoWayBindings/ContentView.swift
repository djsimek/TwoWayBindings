//
//  ContentView.swift
//  TwoWayBindings
//
//  Created by Dan Simek on 8/9/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var pressCount = 0
    @State private var toggleIsOn = true
    @State private var name = ""
    @State private var selectedColor: Color = Color.red
    @State private var selectedDate = Date()
    @State private var stepperValue = 1
    @State private var sliderValue = 50.0
    
    var body: some View {
        VStack {
            Text("Press Count: \(pressCount)")
            Button("Press Me"){
                pressCount += 1
            }
            .buttonStyle(.borderedProminent)
            Spacer()
            TextField("Enter a Name", text: $name)
                .textFieldStyle(.roundedBorder)
            Text("Name entered: \(name)")
            
            Spacer()
            Toggle("Toggle is \(toggleIsOn ? "on" : "off")", isOn: $toggleIsOn)
            Spacer()
            Rectangle()
                .fill(selectedColor)
                .frame(width: 100, height: 100)
            ColorPicker("Pick a Rectangel Color", selection: $selectedColor)
            
            Spacer()
            DatePicker("Date:", selection: $selectedDate)
            Text("Selected date is : \(selectedDate.formatted(date: .abbreviated, time: .shortened))")
            Spacer()
            Stepper("Stepper value: \(stepperValue)", value: $stepperValue, in: 1...10)
            
            Spacer()
            //Slider(value: $sliderValue, in: 0...100)
            Slider(value: $sliderValue, in: 0...100) {
                //Accessibility Label
            } minimumValueLabel: {
                Image(systemName: "speaker.minus")
                //Text("0")
            } maximumValueLabel: {
                Image(systemName: "speaker.plus")
                //Text("100")
            }
            
            Text("Slider value: \(Int(sliderValue))%")
            //Text("Slider value: \(sliderValue.formatted(.number.precision(.fractionLength(1))))")
            //Text("Slider value: \(String(format: "%.0f", sliderValue))")
            
        }
        .font(.title2)
        .padding()
    }
}

#Preview {
    ContentView()
}
