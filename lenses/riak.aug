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

  let ip_port_tuple =
      rspace lbrace
    . [ label "ip"   . Quote.do_dquote ( store Rx.ip ) ]
    . lrspace comma
    . [ label "port" . Erlang.integer ]
    . lspace rbrace

  let integer_value (kw:string) = Erlang.value kw Erlang.integer
  let path_value (kw:string)    = Erlang.value kw Erlang.path

  let ip_port_list (kw:string) = Erlang.list kw ip_port_tuple

  (******** Riak app config ********)


  (******** Standard autoload setup ********)

  let lns = (Util.empty | comment)*
  let filter = incl "/etc/riak/app.config"
  let xmf = transform lns filter
