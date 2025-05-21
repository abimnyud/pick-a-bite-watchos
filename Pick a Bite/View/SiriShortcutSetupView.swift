//
//  SiriShortcutSetupView.swift
//  Pick a Bite
//
//  Created by Abimanyu Damarjati on 19/05/25.
//

import IntentsUI
import SwiftUI

struct SiriShortcutSetupView: UIViewControllerRepresentable {
    // MARK: - Variables -

    @Binding var isPresented: Bool
    
    // Creates the Siri Shortcut setup view controller.
    func makeUIViewController(context: Context) -> INUIAddVoiceShortcutViewController {
        let intent = GetRandomFoodTenantIntent()
        intent.suggestedInvocationPhrase = "Give me random food recommendation"
        
        let shortcut = INShortcut(intent: intent)!
        let vc = INUIAddVoiceShortcutViewController(shortcut: shortcut)
        vc.delegate = context.coordinator
        return vc
    }
    
    // Updates the Siri Shortcut setup view controller if needed.
    func updateUIViewController(_ uiViewController: INUIAddVoiceShortcutViewController, context: Context) {
        // Update the view controller if needed
    }
    
    // Creates a coordinator to handle interactions with the Siri Shortcut setup view.
    func makeCoordinator() -> Coordinator {
        Coordinator(isPresented: $isPresented)
    }
    
    // Coordinator to handle interactions with the Siri Shortcut setup view.
    class Coordinator: NSObject, INUIAddVoiceShortcutViewControllerDelegate {
        @Binding var isPresented: Bool
        
        init(isPresented: Binding<Bool>) {
            _isPresented = isPresented
        }
        
        // Called when adding a voice shortcut is completed.
        func addVoiceShortcutViewController(_ controller: INUIAddVoiceShortcutViewController, didFinishWith voiceShortcut: INVoiceShortcut?, error: Error?) {
            // Handle the completion
            isPresented = false
        }
        
        // Called when adding a voice shortcut is canceled.
        func addVoiceShortcutViewControllerDidCancel(_ controller: INUIAddVoiceShortcutViewController) {
            // Handle cancellation
            isPresented = false
        }
    }
}
