//
//  LSideBtn.swift
//  Done
//
//  Created by Szymon on 11/11/2025.
//
import SwiftUI

import SwiftUI

// Dokładny kształt z Figmy - konwersja 1:1 z SVG
struct WypukloscZKola: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Skalowanie z oryginalnych wymiarów SVG (81x150) do rect
        let scaleX = rect.width / 81
        let scaleY = rect.height / 150
        
        // Ścieżka z Figmy - dokładna konwersja
        // M64.7557 75
        path.move(to: CGPoint(
            x: rect.minX + 64.7557 * scaleX,
            y: rect.minY + 75 * scaleY
        ))
        
        // C64.7557 117.5 100.519 150 64.7557 150
        path.addCurve(
            to: CGPoint(
                x: rect.minX + 64.7557 * scaleX,
                y: rect.minY + 150 * scaleY
            ),
            control1: CGPoint(
                x: rect.minX + 64.7557 * scaleX,
                y: rect.minY + 117.5 * scaleY
            ),
            control2: CGPoint(
                x: rect.minX + 100.519 * scaleX,
                y: rect.minY + 150 * scaleY
            )
        )
        
        // C28.9921 150 0 116.421 0 75
        path.addCurve(
            to: CGPoint(
                x: rect.minX + 0 * scaleX,
                y: rect.minY + 75 * scaleY
            ),
            control1: CGPoint(
                x: rect.minX + 28.9921 * scaleX,
                y: rect.minY + 150 * scaleY
            ),
            control2: CGPoint(
                x: rect.minX + 0 * scaleX,
                y: rect.minY + 116.421 * scaleY
            )
        )
        
        // C0 33.5786 28.9921 0 64.7557 0
        path.addCurve(
            to: CGPoint(
                x: rect.minX + 64.7557 * scaleX,
                y: rect.minY + 0 * scaleY
            ),
            control1: CGPoint(
                x: rect.minX + 0 * scaleX,
                y: rect.minY + 33.5786 * scaleY
            ),
            control2: CGPoint(
                x: rect.minX + 28.9921 * scaleX,
                y: rect.minY + 0 * scaleY
            )
        )
        
        // C100.519 0 64.7557 32.5 64.7557 75
        path.addCurve(
            to: CGPoint(
                x: rect.minX + 64.7557 * scaleX,
                y: rect.minY + 75 * scaleY
            ),
            control1: CGPoint(
                x: rect.minX + 100.519 * scaleX,
                y: rect.minY + 0 * scaleY
            ),
            control2: CGPoint(
                x: rect.minX + 64.7557 * scaleX,
                y: rect.minY + 32.5 * scaleY
            )
        )
        
        return path
    }
}
