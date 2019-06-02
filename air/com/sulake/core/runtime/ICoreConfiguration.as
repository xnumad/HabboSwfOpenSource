//com.sulake.core.runtime.ICoreConfiguration

package com.sulake.core.runtime{
    import flash.utils.Dictionary;

    public /*dynamic*/ interface ICoreConfiguration extends IUnknown {

        function propertyExists(k:String):Boolean;
        function getProperty(k:String, _arg_2:Dictionary=null):String;
        function setProperty(k:String, _arg_2:String, _arg_3:Boolean=false, _arg_4:Boolean=false):void;
        function getBoolean(k:String):Boolean;
        function getInteger(k:String, _arg_2:int):int;
        function interpolate(k:String):String;
        function updateUrlProtocol(k:String):String;

    }
}//package com.sulake.core.runtime

