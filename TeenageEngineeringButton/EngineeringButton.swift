//
//  EngineeringButton.swift
//  TeenageEngineeringButton
//
//  Created by pascal jesenberger on 05/10/2024.
//
import SwiftUI

enum EngineeringPalette {
    case orange, darkGray, gray, lightGray, white
    
    var textColor: Color {
        self == .white ? .neutral0 : .white
    }
    
    var background: Color {
        switch self {
        case .orange: .orange2
        case .darkGray: .darkGray2
        case .gray: .gray2
        case .lightGray: .lightGray2
        case .white: .white2
        }
    }
    
    var backgroundActive: Color {
        switch self {
        case .orange: .orange3
        case .darkGray: .darkGray3
        case .gray: .gray3
        case .lightGray: .lightGray3
        case .white: .white3
        }
    }
    
    var lightShadow: Color {
        switch self {
        case .orange: .orange1
        case .darkGray: .darkGray1
        case .gray: .gray1
        case .lightGray: .lightGray1
        case .white: .white1
        }
    }
    
    var darkShadow: Color {
        switch self {
        case .orange: .orange4
        case .darkGray: .darkGray4
        case .gray: .gray4
        case .lightGray: .lightGray4
        case .white: .white4
        }
    }
}

struct EngineeringButton: View {
    let text: String
    let palette: EngineeringPalette
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Image(.noise)
                    .resizable(resizingMode: .tile)
                    .frame(width: 90, height: 42)
                
                Text(text)
                    .foregroundStyle(palette.textColor)
                    .font(.custom("Technotype34_EP_series_21nov-Regular", size: 15.6))
                    .lineLimit(1)
                    .frame(width: 130)
                    .tracking(0.6)
                    .offset(y: 1)
            }
        }
        .buttonStyle(EngineeringButtonStyle(palette: palette))
    }
}

struct EngineeringButtonStyle: ButtonStyle {
    let palette: EngineeringPalette
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            configuration.label
                .frame(width: 94, height: 46)
                .background(
                    RoundedRectangle(cornerRadius: 2)
                        .fill(.black)
                        .shadow(color: Color.white.opacity(0.8), radius: 2, x: 2, y: 2)
                )
            
            configuration.label
                .frame(width: 90, height: 42)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundStyle(
                            (configuration.isPressed ? palette.backgroundActive : palette.background)
                                .shadow(configuration.isPressed ? .inner(color: .black.opacity(0.6), radius: 2, x: 0, y: 0) : .inner(color: palette.lightShadow, radius: 0.6, x: 1.2, y: 1.28))
                                .shadow(configuration.isPressed ? .inner(color: .black.opacity(0.6), radius: 2, x: 0, y: 0) : .inner(color: palette.darkShadow, radius: 0.6, x: -1.2, y: -1.28))
                                .shadow(.drop(color: configuration.isPressed ? Color.clear : .black.opacity(0.86), radius: 2, x: 2.32, y: 2.32))
                        )
                )
                .scaleEffect(configuration.isPressed ? 0.98 : 1)
                .animation(.easeInOut(duration: 0.12), value: configuration.isPressed)
        }
    }
}
