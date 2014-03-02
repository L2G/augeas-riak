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

  let labeled_tuple (label1:string) (value1:lens) (label2:string) (value2:lens) =
      rspace lbrace
    . [ label label1 . value1 ]
    . lrspace comma
    . [ label label2 . value2 ]
    . lspace rbrace

  let ip_port_tuple =
    labeled_tuple "ip" ( Quote.do_dquote ( store Rx.ip ) )
                  "port" Erlang.integer

  let boolean_value (kw:string) = Erlang.value kw Erlang.boolean
  let integer_value (kw:string) = Erlang.value kw Erlang.integer
  let path_value (kw:string)    = Erlang.value kw Erlang.path

  let ip_port_list (kw:string) = Erlang.list kw ip_port_tuple

  (******** Riak app config ********)


  (******** Standard autoload setup ********)

  let lns = (Util.empty | comment)*
  let filter = incl "/etc/riak/app.config"
  let xmf = transform lns filter
