xquery version "1.0-ml";


let $items-to-sort := 
  ('z7.doc','z4.doc', 'z10.doc','z14.doc','z101.doc','z11.doc','z8.doc','z12.doc','z13.doc',
   'z15.doc','z1.doc','z18.doc','z19.doc','z2.doc','z20.doc','z3.doc','z100.doc','z5.doc',
   'z17.doc','z6.doc','z102.doc','z16.doc','z9.doc','1.2.3.4.123','123.1.2.3','2.2.3.4.123',
   '11.2.3.4.123','Ängström','Ångström','Angstrom','Ängström12.3','Ångström12','Angstrom2')


(: use the default MarkLogic collation but treat numbers as numbers :)
for $i in $items-to-sort
order by $i collation "http://marklogic.com/collation/en/MO"
return $i
