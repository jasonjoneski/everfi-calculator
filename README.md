# README - EVERFI Simple Formula Calculator
## Versions
This has been built with _Ruby 2.5.1_ and Rails _5.2.1_.

## Design
This was a pretty straight forward problem to solve using an abstract syntax
tree (AST).

I designed the code of the calculator to parse the formula string and build a
calculator AST of `BinaryOperation` and `TerminalOperation` objects.  By parsing
in reverse operator precedence from right to left, then doing calculations
in an ordered traversal of the AST, the code calculates the highest precedence
operations first, and then on to lower precedence operations. This design allows
for flexible, extensible and maintainable code, and fast performance of
operations.

If I were going to do something involving more operators and syntax, I might
consider using a Gem such as (Parslet)[https://github.com/kschiess/parslet]
to build then parser since it is much more robust for parsing more extensive
grammars.

The rest of the application is written in standard Rails framework code with
_controllers_ and _views_.

## Testing
I believe unit and integration testing vitally important to developing clean
code that I can have faith in and be proud of.  For this application I decided
to write both unit level and component / integration level tests, as I have
found these are both important to verify the robustness of the application code.
First, I unit tested individual operation objects including: `DivideOperation`,
`MultiplyOperation`, `PlusOperation` and `MinusOperation`.  Then, I unit tested
the `OperationParser` to validate it worked for all operations.  Next, I wrote
unit tests for `Calculator` validating that it produced appropriate results and
that all the individual components . Finally, I wrote controller
level integration tests to validate both the successful and error code paths
within the `CalculatorController`.

## Running
To run, you will need [Bundler](https://bundler.io/).  You can install with
`gem install bundler`. Then inside of the directory you can run `rails s`
to launch the server. Finally to run tests you can run `rails test`.
