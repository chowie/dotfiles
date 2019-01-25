<?php

$db = new PDO("informix:host=10.128.34.64; service=1525; database=eos; server=miboecfr; protocol=onsoctcp; EnableScrollableCursors=1", "election", "nicdev1");

print "Connection Established!\n\n";

$stmt = $db->query("select * from systables");
$res = $stmt->fetch( PDO::FETCH_BOTH );
echo $res[0],"\n";
echo $res[1],"\n";
echo $res[2],"\n";
echo $res[3],"\n";
echo $res[4],"\n";
echo $res[5],"\n";
#echo "Table contents: $rows.\n";
