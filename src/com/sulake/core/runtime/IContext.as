package com.sulake.core.runtime
{
    import com.sulake.core.assets.IAssetLibrary;
    import flash.events.IEventDispatcher;
    import flash.display.DisplayObjectContainer;
    import flash.net.URLRequest;
    import flash.system.LoaderContext;
    import com.sulake.core.utils.LibraryLoader;
    import flash.system.ApplicationDomain;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import __AS3__.vec.Vector;

    public interface IContext extends IUnknown 
    {
        function get assets():IAssetLibrary;
        function get events():IEventDispatcher;
        function get root():IContext;
        function error(_arg_1:String, _arg_2:Boolean, _arg_3:int=-1, _arg_4:Error=null):void;
        function getLastErrorMessage():String;
        function debug(_arg_1:String):void;
        function getLastDebugMessage():String;
        function warning(_arg_1:String):void;
        function getLastWarningMessage():String;
        function get displayObjectContainer():DisplayObjectContainer;
        function loadFromFile(_arg_1:URLRequest, _arg_2:LoaderContext):LibraryLoader;
        function attachComponent(_arg_1:Component, _arg_2:Array):void;
        function detachComponent(_arg_1:Component):void;
        function prepareComponent(_arg_1:Class, _arg_2:uint=0, _arg_3:ApplicationDomain=null):IUnknown;
        function prepareAssetLibrary(_arg_1:XML, _arg_2:Class):Boolean;
        function registerUpdateReceiver(_arg_1:IUpdateReceiver, _arg_2:uint):void;
        function removeUpdateReceiver(_arg_1:IUpdateReceiver):void;
        function toXMLString(_arg_1:uint=0):String;
        function get configuration():IHabboConfigurationManager;
        function set configuration(_arg_1:IHabboConfigurationManager):void;
        function addLinkEventTracker(_arg_1:ILinkEventTracker):void;
        function removeLinkEventTracker(_arg_1:ILinkEventTracker):void;
        function createLinkEvent(_arg_1:String):void;
        function get linkEventTrackers():Vector.<ILinkEventTracker>;
    }
}
