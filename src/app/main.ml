open Tallgeese_lib

let connect_to host username =
  let open Ssh.Client in
  let opts =
    { host; username; port = 22; log_level = SSH_LOG_FUNCTIONS; auth = Auto }
  in
  let this_sess = Ssh.init () in
  connect opts this_sess;
  ShellCommand(exec "uname -a" this_sess) |> to_gui

let zipcode_of_ip host =
  Zipcode (Maxminddb.create "etc/GeoLite2-City.mmdb"
           |> Maxminddb.postal_code ~ip:host)
  |> to_gui

let _ = Callback.register "connect_to" connect_to
let _ = Callback.register "zipcode_of_ip" zipcode_of_ip

let () =
  start_prog ()
