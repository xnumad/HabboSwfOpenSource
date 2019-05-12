package com.sulake.habbo.catalog.navigation
{
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.communication.messages.incoming.catalog.NodeData;
    import __AS3__.vec.Vector;
    import com.sulake.core.window.IWindow;

    public interface ICatalogNavigator 
    {
        function dispose():void;
        function get catalog():IHabboCatalog;
        function _Str_19657(_arg_1:NodeData):void;
        function _Str_17980():void;
        function activateNode(_arg_1:ICatalogNode):void;
        function _Str_13937():void;
        function get _Str_3961():Boolean;
        function _Str_5719(_arg_1:int, _arg_2:Boolean=false):Vector.<ICatalogNode>;
        function _Str_10014(_arg_1:String):ICatalogNode;
        function _Str_21310(_arg_1:String):ICatalogNode;
        function _Str_11820(_arg_1:int, _arg_2:ICatalogNode=null):ICatalogNode;
        function openPage(_arg_1:String):void;
        function _Str_15856(_arg_1:int, _arg_2:int):void;
        function _Str_24002(_arg_1:int):void;
        function _Str_14636():void;
        function filter(_arg_1:String, _arg_2:Array):void;
        function get listTemplate():IWindow;
        function getItemTemplate(_arg_1:int):IWindow;
        function get isDeepHierarchy():Boolean;
    }
}
