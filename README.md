# review-tea

Provides [`elm-review`](https://package.elm-lang.org/packages/jfmengels/elm-review/latest/) rules to improve your use of The Elm Architecture.


## Provided rules

- [`NoMissingSubscriptionsCall`](https://package.elm-lang.org/packages/jfmengels/review-tea/1.0.0/NoMissingSubscriptionsCall) - Reports likely missing calls to a `subscriptions` function.
- [`NoUselessSubscriptions`](https://package.elm-lang.org/packages/jfmengels/review-tea/1.0.0/NoUselessSubscriptions) - Reports `subscriptions` functions that never return a subscription.


## Configuration

```elm
module ReviewConfig exposing (config)

import NoMissingSubscriptionsCall
import NoUselessSubscriptions
import Review.Rule exposing (Rule)

config : List Rule
config =
    [ NoMissingSubscriptionsCall.rule
    , NoUselessSubscriptions.rule
    ]
```
