//
//  ContentView.swift
//  Garden
//
//  Created by SUMAGANG, KYLE RUSSLIE on 1/12/26.
//

import SwiftUI
struct ContentView: View {
    @State private var wordsGuessed = 0
       @State private var wordsMissed = 0
       @State private var wordsToGuess = ["SWIFT", "DOG", "CAT"] // All Caps
       @State private var gameStatusMessage = "How many Guesses to Uncover the Hidden Word?"
       @State private var currentWord = 0 // index in wordToGuess
       @State private var guessedLetter = ""
       @State private var imageName = "flower8"
       @State private var playAgainHidden = true
    @FocusState private var textFieldIsFocused: Bool
       
       var body: some View {
           VStack {
               HStack {
                   VStack(alignment: .leading) {
                       Text("Words Guessed: \(wordsGuessed)")
                       Text("Words Missed: \(wordsMissed)")
                   }
                   Spacer()
                   VStack(alignment: .trailing) {
                       Text("Words to Guess: \(wordsToGuess.count - (wordsGuessed + wordsMissed))")
                       Text("Words in Game: \(wordsToGuess.count)")
                   }
               }
               .padding(.horizontal)
               
               Spacer()
               
               Text(gameStatusMessage)
                   .font(.title)
                   .multilineTextAlignment(.center)
                   .padding()
               
               //TODO: Switch to wordsToGuessed[currentWord]
               Text("_____")
                   .font(.title)
               
               if playAgainHidden {
                   HStack {
                       TextField("", text: $guessedLetter)
                           .textFieldStyle(.roundedBorder)
                           .frame(width: 30)
                           .overlay {
                               RoundedRectangle(cornerRadius: 5)
                                   .stroke(.gray, lineWidth: 2)
                           }
                           .keyboardType(.asciiCapable)
                           .submitLabel(.done)
                           .autocorrectionDisabled()
                           .textInputAutocapitalization(.characters)
                           .onChange(of: guessedLetter) {
                               guessedLetter = guessedLetter.trimmingCharacters(in: .letters.inverted)
                               guard let lastChar =  guessedLetter.last else {
                                   return
                               }
                               guessedLetter = String(lastChar).uppercased()
                           }
                           .focused($textFieldIsFocused)
                       
                       Button("Guess a Letter:") {
                           //TODO: Guess  Letter button action here
                           textFieldIsFocused = false
                       }
                       .buttonStyle(.bordered)
                       .tint(.mint)
                       .disabled(guessedLetter.isEmpty)
                   }
               } else {
                   Button("Another Word?") {
                       //TODO: Another Word Button Action Here
                 
                   }
                   .buttonStyle(.borderedProminent)
                   .tint(.mint)
               }
               
               Spacer()
               
               Image (imageName)
                   .resizable()
                   .scaledToFit()
           }
           .ignoresSafeArea(edges: .bottom)
       }
   }
#Preview {
    ContentView()
}
