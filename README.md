# Flutter-Introduction

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Description

This project tests and demonstrates how the Uptrillion MPOS Service API operates, particularly its security algorithm. First, the GET HTTP method is used to retrieve the merchant's fore-end salt, where it will be used to for password security. Next, the password is hashed, and GetAuth API is invoked with the POST HTTP method. Finally, Transact can be invoked with algorithm calculation and the retrieved encryption key.

![Flutter-Introduction-Screen](https://github.com/user-attachments/assets/e7766c07-ed87-4ab9-9e78-1acd718fab27)

## Required Downloads

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- Visual Studio Code
- Android Studio

## Steps to Setup

1. Clone the repository
2. Ensure Flutter bin folder is added to your PATH (per official Flutter install instructions)
3. Run `flutter doctor` in a terminal window and address any displayed issues
    - If flutter is not recognized and you added it to your PATH, restart your terminal.
4. Setup your Android device for development
    - Connect to your dev computer via USB cable
    - Accept USB Debugging on the Android device
        - You may need to update the Developer options on the device if it has not been setup for development use already
    - Run `flutter devices` in terminal and find your device on the list
5. Open Android studio to the **android** directory of the flutter project
    - Sync the gradle build (should be a popup at the top of the IDE)
6. Open the project in Visual Studio Code, and open the ‘Run and Debug’ window
7. Click the green ‘Start Debugging’ button. 
8. VSCode contains a debug console to see you your logs, additionally includes useful extensions to help with debugging
9. Invoke GetForeEndSalt by clicking the "ForeEndSalt" button, see the retrieved ForeEndSalt appear in the box
10. Invoke GetAuth by clicking the "Auth" button, see the retrieved AccessKeySecret appear in the box
11. Invoke Transact by clicking the "Transact" button, see the response body appear in the box
12. Clear all the boxes by clicking the "Cancel" button
