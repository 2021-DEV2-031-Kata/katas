# Tic Tac Toe

## Requirements 

The project was built with `Xcode` version `12.5`. 

## Compile and run

Open the provided `TicTacToe.xcodeproj` project file and press `CMD + B` to build the project and consequently, the `Run` button. 

Alternatively application can be started by pressing `CMD + R` on the keyboard. 

## Configuration

Size fo the board can be configured with the `boardSize` property in `ViewController` class. Default size of the board is `3`. 

The app can be configured to run with any size of the board. However, the UI currently makes it possible to create a board of a maximum size of 8, on default device(iPod Touch 7 gen). Choosing a device with bigger screen, will allow bigger size of the board. After that the controls reach outside the visible area and due to implementation of the UI, cannot correctly be displayed.

Additionally user can configure default player's marks, in the `ViewController` class, by setting corresponding values for `firstPlayer` and `secondPlayer`


## Unit tests

There are a total of `31` of unit tests provided to verify correct behaviour of the application. In order to run all unit test, run `CMD + U`


## UI Test

There are no UI test provided. The target for UI test is diabled. 

## Commits

There are a total of `98` commits, which demonstrate the development of the project. There are a number of non-compiling commits, provided in order to demonstrate the `TDD` appoach, where a test is provided before the actual implementation of the corresonding production code.

## UI layer

The UI layer is kept as simple as possible and does not make use of any popular architectural patterns like MVP or MVVM. 
