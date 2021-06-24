//
//  ContentView.swift
//  TestProgressCircle
//
//  Created by Nigel Gee on 24/06/2021.
//

import SwiftUI

struct ContentView: View {
    @State var progress: Double = 0.25

    private var formattedPercent: String {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 1
        formatter.numberStyle = .percent
        return formatter.string(from: NSNumber(value: progress)) ?? ""
    }

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.black, lineWidth: 24)


            Text(formattedPercent)
                .font(.system(size: 64))

            Circle()
                .trim(from: 0.0, to: CGFloat(progress))
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 13, lineCap: .round))
                .rotationEffect(.degrees(-90))
        }
        .padding()
        .onTapGesture {
            withAnimation {
                progress = min(1.0, progress + 0.25)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
