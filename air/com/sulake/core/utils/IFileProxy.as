//com.sulake.core.utils.IFileProxy

package com.sulake.core.utils{
    import flash.utils.ByteArray;

    public /*dynamic*/ interface IFileProxy {

        function clearCache():void;
        function localFilePath(k:String):String;
        function cacheFilePath(k:String):String;
        function loadLocalBitmapData(k:String, _arg_2:Function):void;
        function cacheFileExists(k:String):Boolean;
        function readCache(k:String):ByteArray;
        function writeCache(k:String, _arg_2:ByteArray):void;
        function deleteCacheDirectory(k:String):void;
        function swapObjectIn(k:Object):int;
        function swapObjectOut(k:int):Object;

    }
}//package com.sulake.core.utils

