module Test_riak =

  (******** Primitives ********)

  (* comment *)
  let comment = "%% this is a comment\n"

  test Riak.comment get comment = { "#comment" = "% this is a comment" }

  (* ip_port_tuple *)
  let ip_port_tuple = "{\"8.8.8.8\", 53}"

  test Riak.ip_port_tuple
    get ip_port_tuple = ( {"ip" = "8.8.8.8"} {"port" = "53"} )

  test Riak.ip_port_tuple
    put ip_port_tuple after
      set "/ip" "127.128.129.130";
      set "/port" "123"
    = "{\"127.128.129.130\", 123}"

  test Riak.ip_port_tuple
    put ip_port_tuple after
      set "/ip" "dont.take.a.hostname.example.com"
    = *

  (* user_tuple *)
  let user_tuple = "{\"isis\",\"guest\"}"

  test Riak.user_tuple
    get user_tuple = ( {"username" = "isis"} {"password" = "guest"} )

  (* boolean_value *)
  let boolean_value = "{truthiness, false}"

  test (Riak.boolean_value "truthiness")
    get boolean_value = { "truthiness" = "false" }

  test (Riak.boolean_value "truthiness")
    put boolean_value after
      set "/truthiness" "true"
    = "{truthiness, true}"

  test (Riak.boolean_value "truthiness")
    put boolean_value after
      set "/truthiness" "kinda_sorta"
    = *

  (* integer_value *)
  let integer_value = "{magic_number, 33}"

  test (Riak.integer_value "magic_number")
    get integer_value = { "magic_number" = "33" }

  test (Riak.integer_value "magic_number")
    put integer_value after
      set "/magic_number" "42"
    = "{magic_number, 42}"

  test (Riak.integer_value "magic_number")
    put integer_value after
      set "/magic_number" "I am not a number, I am a free man!"
    = *

  (* path_value *)
  let ring_state_dir = "{ring_state_dir, \"/var/lib/riak/ring\"}"

  test (Riak.path_value "ring_state_dir")
    get ring_state_dir = { "ring_state_dir" = "/var/lib/riak/ring" }

  test (Riak.path_value "ring_state_dir")
    put ring_state_dir after
      set "/ring_state_dir" "/opt/local/lib/riak/ring"
    = "{ring_state_dir, \"/opt/local/lib/riak/ring\"}"

  (* ip_port_list *)
  let ip_port_list = "{pb, [ {\"127.0.0.1\", 8087} ]}"

  test (Riak.ip_port_list "pb")
    get ip_port_list = { "pb" {"ip" = "127.0.0.1"} {"port" = "8087"} }

  test (Riak.ip_port_list "pb")
    put ip_port_list after
      set "/pb/ip" "8.8.8.8";
      set "/pb/port" "23";
      set "/pb/ip[last]" "127.126.125.124";
      set "/pb/port[last]" "8888"
    = "{pb, [ {\"8.8.8.8\", 23},{\"127.126.125.124\",8888} ]}"

  (* user_list *)
  let user_list = "{userlist, [{\"user\",\"pass\"}]}"

  test (Riak.user_list "userlist")
    get user_list = { "userlist"
                      { "username" = "user" }
                      { "password" = "pass" }
                    }

  test (Riak.user_list "userlist")
    put user_list after
      set "/userlist/username" "archer";
      set "/userlist/password" "duchess";
      set "/userlist/username[last]" "krieger";
      set "/userlist/password[last]" "bumfights"
    = "{userlist, [{\"archer\",\"duchess\"},{\"krieger\",\"bumfights\"}]}"
