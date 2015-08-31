external start_prog : unit -> unit = "cocoa_ml_start"
external send_result : string -> unit = "cocoa_ml_receive_query_result"

let connect_to host username =
  let open Ssh.Client in
  let opts =
    { host; username; port = 22; log_level = SSH_LOG_FUNCTIONS; auth = Auto }
  in
  let this_sess = Ssh.init () in
  connect opts this_sess;
  exec "uname -a" this_sess |> send_result

let _ = Callback.register "connect_to" connect_to

let () =
  start_prog ()

