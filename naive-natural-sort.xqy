xquery version "1.0-ml";


declare namespace natsort = "https://github.com/JKesMc9tqIQe9M/xquery-natural-sort";
declare namespace xf = "http://www.w3.org/2005/xpath-functions";
import module namespace functx = "http://www.functx.com" at "/MarkLogic/functx/functx-1.0-nodoc-2007-01.xqy";


declare %public function natsort:natsort($s as item()*) as item()* {
  let $pad-length := fn:max($s ! fn:analyze-string(., '([0-9]+)')/xf:match ! fn:string-length(.)) + 1
  for $item in $s    
  let $sort-comparator :=
    fn:string-join(
      let $decomposed := fn:analyze-string($item, '([0-9]+)')/xf:*
      for $i in $decomposed
      return
        if ($i/self::xf:match)
        then fn:string(functx:pad-integer-to-length(fn:number($i), $pad-length))
        else fn:string($i)
      , '')
  order by $sort-comparator
  return $item
};
