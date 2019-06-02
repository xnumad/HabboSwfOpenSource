//com.sulake.habbo.room.IRoomContentLoaderUrl

package com.sulake.habbo.room{
    public /*dynamic*/ interface IRoomContentLoaderUrl {

        function get url():String;
        function get cacheKey():String;
        function get cacheRevision():int;
        function get assetName():String;
        function get fileType():String;

    }
}//package com.sulake.habbo.room

