xquery version "1.0";

import module namespace config="http://exist-db.org/xquery/apps/config" at "config.xqm";
import module namespace retrieve-mods="http://exist-db.org/mods/retrieve" at "xmldb:exist:///db/apps/tamboti/themes/default/modules/retrieve-mods.xql";

declare namespace mods="http://www.loc.gov/mods/v3";

declare option exist:serialize "media-type=text/html method=html5";

let $id := request:get-parameter("id", ())
let $entry := collection($config:resource-root)//mods:mods[@ID = $id]
let $collection-short := util:collection-name($entry)
return
    retrieve-mods:format-detail-view($id, $entry, util:collection-name($entry))
