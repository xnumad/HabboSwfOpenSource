//com.sulake.core.runtime.IContext

package com.sulake.core.runtime{
    import com.sulake.core.assets.IAssetLibrary;
    import flash.events.IEventDispatcher;
    import flash.display.DisplayObjectContainer;
    import flash.net.URLRequest;
    import flash.system.LoaderContext;
    import com.sulake.core.utils.LibraryLoader;
    import flash.system.ApplicationDomain;

    public /*dynamic*/ interface IContext extends IUnknown {

        function get assets():IAssetLibrary;
        function get events():IEventDispatcher;
        function get root():IContext;
        function error(k:String, _arg_2:Boolean, _arg_3:int=-1, _arg_4:Error=null):void;
        function getLastErrorMessage():String;
        function debug(k:String):void;
        function getLastDebugMessage():String;
        function warning(k:String):void;
        function getLastWarningMessage():String;
        function get displayObjectContainer():DisplayObjectContainer;
        function loadFromFile(k:URLRequest, _arg_2:LoaderContext):LibraryLoader;
        function attachComponent(k:Component, _arg_2:Array):void;
        function detachComponent(k:Component):void;
        function prepareComponent(k:Class, _arg_2:uint=0, _arg_3:ApplicationDomain=null):IUnknown;
        function prepareAssetLibrary(k:XML, _arg_2:Class):Boolean;
        function registerUpdateReceiver(k:IUpdateReceiver, _arg_2:uint):void;
        function removeUpdateReceiver(k:IUpdateReceiver):void;
        function toXMLString(k:uint=0):String;
        function get configuration():ICoreConfiguration;
        function set configuration(k:ICoreConfiguration):void;

    }
}//package com.sulake.core.runtime

