module Riak =
  autoload xmf

  (******** Primitives ********)

  let comma   = Erlang.comma
  let comment = Erlang.comment
  let lbrace  = Erlang.lbrace
  let lrspace = Erlang.lrspace
  let lspace  = Erlang.lspace
  let rbrace  = Erlang.rbrace
  let rspace  = Erlang.rspace

  let path_value (kw:string) = Erlang.value kw Erlang.path

  (******** Riak app config ********)


  (******** Standard autoload setup ********)

  let lns = (Util.empty | comment)*
  let filter = incl "/etc/riak/app.config"
  let xmf = transform lns filter
