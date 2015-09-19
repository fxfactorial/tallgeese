type results = Zipcode of string
             | ShellCommand of string

type exn += Connection_failure

external start_prog : unit -> unit = "cocoa_ml_start"
external to_gui : results -> unit = "cocoa_ml_receive_query_result"
