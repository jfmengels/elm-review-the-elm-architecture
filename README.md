# review-tea

Provides [`elm-review`](https://package.elm-lang.org/packages/jfmengels/elm-review/latest/) rules to improve your use of The Elm Architecture.


## Provided rules

- [`NoMissingSubscriptionsCall`](https://package.elm-lang.org/packages/jfmengels/review-tea/1.0.0/NoMissingSubscriptionsCall) - Forbids exporting everything from a module.


## Configuration

```elm
module ReviewConfig exposing (config)

import NoMissingSubscriptionsCall
import Review.Rule exposing (Rule)

config : List Rule
config =
    [ NoMissingSubscriptionsCall.rule
    ]
```
