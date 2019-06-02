//com.sulake.room.IRoomManagerListener

package com.sulake.room{
    public /*dynamic*/ interface IRoomManagerListener {

        function roomManagerInitialized(k:Boolean):void;
        function contentLoaded(k:String, _arg_2:Boolean):void;
        function objectInitialized(k:String, _arg_2:int, _arg_3:int):void;
        function objectsInitialized(k:String):void;

    }
}//package com.sulake.room

