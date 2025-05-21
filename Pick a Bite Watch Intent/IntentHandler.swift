//
//  IntentHandler.swift
//  Pick a Bite Watch Intent
//
//  Created by Abimanyu Damarjati on 19/05/25.
//

import Intents

class IntentHandler: INExtension {
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.

        if intent is GetRandomFoodTenantIntent {
            return GetRandomFoodTenantIntentHandler()
        }

        return self
    }
}
