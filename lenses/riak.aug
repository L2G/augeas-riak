module Riak =
  autoload xmf

  (* Primitives *)

  let comment = Erlang.comment

  let path_value (kw:string) = Erlang.value kw Erlang.path
  let ring_state_dir = path_value "ring_state_dir"

  (* Riak app config *)


  (* Standard autoload setup *)
  let lns = (Util.empty | comment)*

  let filter = incl "/etc/riak/app.config"

  let xmf = transform lns filter
