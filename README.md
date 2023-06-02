# ANSG IDM

## Project Structure

The project is divided into  layers

 - Data Layer
    - Local DB 
    - API Service
    - Shared Preferences
   
- Domain Layer 
    - repository

- Feature Layer
    - presentation/UI (widgets)
    - business logic (riverpod)


Each Layer has it's own function and jurisdictions 

the correct flow of data is represented in the list above


## Data Layer
This would be properly documented when we have a full grasp of all the different ways the app interacts with data both locally and from the internet

this consists of the models folder, some services that would be represented later like database and shared prefs, api requests, etc

## Domain Layer
This is the connection between the data layer and presentation layer 
the domain layer handles transmission to and fro the data layer

this consists solely of the repository folder, this is the handshake between the other two layers 

## Feature Layer
This is where all of our UI and it's related logic would be handled

this consists of the views, widgets and some config files 

## Packages and Functions

- another_flushbar: A flexible widget for user notification
- cupertino_icons
- dio: A powerful HTTP package for Dart/Flutter
- extended_image: Official extension image, support placeholder(loading)
- external_path: A flutter plugin to external public directory path
- flutter_barcode_scanner: A plugin for barcode scanning 
- flutter_native_splash: Customize Flutter's default white native splas
- flutter_riverpod: State management option
- flutter_screenutil: A flutter plugin for adapting screen and font size
- flutter_svg: An SVG rendering and widget library for Flutter
- grouped_list: Flutter ListView where the list items can be grouped into sections
- intl: Contains code to deal with internationalized/localized
- keyboard_dismisser: To hide the keyboard when performing a gesture outside of it
- lottie: Render After Effects animations natively on Flutter
- package_info_plus: for querying information about the application package
- path_provider: plugin for getting commonly used locations on host platform file systems
- pull_to_refresh: a widget provided to the flutter scroll component
- screenshot: Capture any Widget as an image
- share_plus: Flutter plugin for sharing content via the platform share UI
- shared_preferences: Local storage persistence
- shimmer: to add shimmer effect in Flutter project
- vcard_maintained: A dart port of vCard
