# Sinclairity

The Sinclair Formula is a formula used in weightlifting to normalize weights
across weightclasses. By plugging in a lifter's bodyweight and the weight they
lifted, you can get a normalized result that can then be used to compare that
weight against lifters in other weight classes.

This app is mostly a testbed for me to play with various architectures, but
will also (eventually) be a simple app for calculating sinclair totals.

## Features

This app is just complicated enough to render itself as a useful test ground
for architectures, without getting bogged down in deep domain concerns. It
will need the following base features:

 - An input for switching between male and female constants
 - An input for the lifter's bodyweight
 - An input for the weight to convert
 - An output for the converted weight

Optional additional features:

 - Animations for the conversion
 - Theming support
 - Network requests for fetching the constants needed for the formula (these
   update every ~4 years)

## Architectures

 - Elm
 - MVVM (heavy use of RxSwift or ReactiveSwift)
