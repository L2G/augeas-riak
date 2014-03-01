module Test_riak =

  (******** Primitives ********)

  (* comment *)
  let comment = "%% this is a comment\n"

  test Riak.comment get comment = { "#comment" = "% this is a comment" }

  (* path_value *)
  let ring_state_dir = "{ring_state_dir, \"/var/lib/riak/ring\"}"

  test (Riak.path_value "ring_state_dir")
    get ring_state_dir = { "ring_state_dir" = "/var/lib/riak/ring" }

  test (Riak.path_value "ring_state_dir")
    put ring_state_dir after
      set "/ring_state_dir" "/opt/local/lib/riak/ring"
    = "{ring_state_dir, \"/opt/local/lib/riak/ring\"}"

