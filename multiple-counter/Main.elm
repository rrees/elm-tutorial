import CounterPair exposing (view, update)
import StartApp.Simple exposing (start)

main = start { model = 0, view = view, update = update}

