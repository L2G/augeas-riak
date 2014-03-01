module Test_riak =
	test lns get "[
        {bitcask, [
                {data_root, \"/var/lib/riak/bitcask\"}
        ]},
        {eleveldb, [
                {data_root, \"/var/lib/riak/leveldb\"}
        ]},
	{kernel, [
                {inet_dist_listen_max, 7999},
                {inet_dist_listen_min, 6000}
        ]}
].\n" = ?

