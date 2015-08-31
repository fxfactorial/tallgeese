


let test_func arg = print_endline "Called from C"

let _ = Callback.register "test_func" test_func

external start_prog : unit -> unit = "cocoa_ml_start"

let () =
  start_prog ()

