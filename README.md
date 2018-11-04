# BiometricAutomationDemo
Dependency-free iOS Face ID and Touch ID automation example.

## Zoom out

UI testing anything related to biometrics is really tough on iOS because there's no way to simulate/turn on biometrics on the Simulator from within UI tests, wihtout some sort of external dependency.

Until now.

This project serves as a demo project for a [blog post](https://edit.theappbusiness.com/so-you-want-to-automate-ios-biometrics-81bd015f5d38) I wrote about how we approached finding a solution, and eventually ended up with what you can find in this repo.

## The demo

If you download or clone the repo, all you'll find is an Xcode project with a simple app and some UI tests. 

Once you open the project you'll find four UI tests: 
- One for launching the app with biometrics disabled. 
- One for launching the app with biometrics enabled. 
- One for successfully authenticating with biometrics.
- One for failing to authenticate with biometrics.

The UI in the app adapts based on what the state of biometrics are at launch, so you can easily see the UI tests in action.

## Face ID vs Touch ID

Although Face ID and Touch ID APIs are largely the same, there are some things to consider when automating them. 

For example, you don't need to ask the user's permission to use Touch ID but the first time you try to authenticate the user with Face ID a permissions prompt will appear. 

The demo project handles this by checking for the existence of the permissions prompt before trying to approve it, since it will only show once for Face ID and never for Touch ID. 

Another thing to be aware of us the differences in the UI between Touch ID and Face ID. Touch ID always has a visible cancel button, whereas Face ID doesn't.

## Further reading

If you want to read how we structure our automation tests to be significantly easier to read and maintain, check out [this series of posts](https://edit.theappbusiness.com/swifty-gherkins-part-1-28abba7dfd8).

Enjoy!
