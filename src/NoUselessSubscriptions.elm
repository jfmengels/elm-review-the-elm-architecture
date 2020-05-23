module NoUselessSubscriptions exposing (rule)

{-|

@docs rule

-}

import Elm.Syntax.Declaration as Declaration exposing (Declaration)
import Elm.Syntax.Expression as Expression
import Elm.Syntax.Node as Node exposing (Node)
import Review.Rule as Rule exposing (Error, Rule)


{-| Reports `subscriptions` functions that never return a subscription.

In my opinion, this is often a sign of premature architectural work, where you
set up an `init`, `view`, `update` and `subscriptions` functions. I think
it is better to define them as they are needed, to avoid adding upfront complexity
that turn out to be unnecessary later.

    config =
        [ NoUselessSubscriptions.rule
        ]


## Fail

    subscriptions : Model -> Sub Msg
    subscriptions model =
        Sub.none


## Success

    main =
        Browser.element
            { init = init
            , update = update
            , subscriptions = \_ -> Sub.none
            , view = view
            }

-}
rule : Rule
rule =
    Rule.newModuleRuleSchema "NoUselessSubscriptions" ()
        |> Rule.withSimpleDeclarationVisitor declarationVisitor
        |> Rule.fromModuleRuleSchema


declarationVisitor : Node Declaration -> List (Error {})
declarationVisitor declaration =
    case Node.value declaration of
        Declaration.FunctionDeclaration function ->
            if
                (function.declaration
                    |> Node.value
                    |> .name
                    |> Node.value
                )
                    == "subscriptions"
            then
                case Node.value function.declaration |> .expression |> Node.value of
                    Expression.FunctionOrValue [ "Sub" ] "none" ->
                        [ Rule.error
                            { message = "The `subscription` function never returns any subscriptions"
                            , details = [ "The `subscription` function never returns any subscriptions. You might as well remove it." ]
                            }
                            (Node.value function.declaration |> .expression |> Node.range)
                        ]

                    _ ->
                        []

            else
                []

        _ ->
            []
