module Riak =
  autoload xmf

  (******** Primitives ********)

  let comment = Erlang.comment

  let path_value (kw:string) = Erlang.value kw Erlang.path

  (******** Riak app config ********)


  (******** Standard autoload setup ********)

  let lns = (Util.empty | comment)*
  let filter = incl "/etc/riak/app.config"
  let xmf = transform lns filter
