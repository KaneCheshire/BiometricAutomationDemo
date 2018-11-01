# BiometricAutomationDemo
Dependency free iOS biometric automation example.

## Zoom out

UI testing anything related to biometrics is really tough on iOS because there's no official way to simulate/turn on biometrics on the Simulator.

Until now.

This project serves as a demo project for a [blog post](https://edit.theappbusiness.com/so-you-want-to-automate-ios-biometrics-81bd015f5d38) I wrote about how we approached finding a solution, and eventually ended up with what you can find in this repo.

## The demo

If you download or clone the repo, all you'll find is an Xcode project with a simple app and some UI tests. 

Once you open the project you'll find two UI tests, one for launching the app with biometrics disabled, and one for launching the app with biometrics enabled. The UI in the app adapts based on what the state of biometrics are at launch, so you can easily see the UI tests in action.

As a bonus, one thing I didn't cover in the post is how to simulate a successful biometric authentication, so I've added an example in the demo.

Enjoy!
