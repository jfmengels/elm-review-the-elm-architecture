# elm-review-the-elm-architecture

Provides [`elm-review`](https://package.elm-lang.org/packages/jfmengels/elm-review/latest/) rules to improve your use of The Elm Architecture.


## Provided rules

- [`NoMissingSubscriptionsCall`](https://package.elm-lang.org/packages/jfmengels/elm-review-the-elm-architecture/1.0.3/NoMissingSubscriptionsCall) - Reports likely missing calls to a `subscriptions` function.
- [`NoRecursiveUpdate`](https://package.elm-lang.org/packages/jfmengels/elm-review-the-elm-architecture/1.0.3/NoRecursiveUpdate) - Reports recursive calls of an `update` function.
- [`NoUselessSubscriptions`](https://package.elm-lang.org/packages/jfmengels/elm-review-the-elm-architecture/1.0.3/NoUselessSubscriptions) - Reports `subscriptions` functions that never return a subscription.


## Configuration

```elm
module ReviewConfig exposing (config)

import NoMissingSubscriptionsCall
import NoRecursiveUpdate
import NoUselessSubscriptions
import Review.Rule exposing (Rule)

config : List Rule
config =
    [ NoMissingSubscriptionsCall.rule
    , NoRecursiveUpdate.rule
    , NoUselessSubscriptions.rule
    ]
```

## Try it out

You can try the example configuration above out by running the following command:

```bash
elm-review --template jfmengels/elm-review-the-elm-architecture/example
```
