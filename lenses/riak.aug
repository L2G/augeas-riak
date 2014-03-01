module Riak =
  let data_root = Erlang.value "data_root" Erlang.path

  let bitcask  = Erlang.list "bitcask" data_root
  let eleveldb = Erlang.list "eleveldb" data_root

  let kernel = Erlang.list "kernel" (
    Erlang.value "inet_dist_listen_max" Erlang.integer |
    Erlang.value "inet_dist_listen_min" Erlang.integer
  )

  let app_config = (bitcask | eleveldb | kernel)

  let lns = Erlang.config app_config
