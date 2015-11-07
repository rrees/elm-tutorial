import CounterPair exposing (view, update)
import StartApp.Simple exposing (start)

main = start { model = CounterPair.init 0 0, view = view, update = update}

