
include Make.Server(Conduit_mirage.Flow)

let connect t =
  let listen s f =
    Conduit_mirage.listen t s (fun ip ->
        Printf.printf "cohttp mirage server with conduit connection from %s\n"
          (Ipaddr.V4.to_string ip);
        listen f)
  in
  Lwt.return listen
