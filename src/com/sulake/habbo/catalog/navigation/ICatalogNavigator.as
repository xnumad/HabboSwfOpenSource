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
        function buildCatalogIndex(_arg_1:NodeData):void;
        function showIndex():void;
        function activateNode(_arg_1:ICatalogNode):void;
        function loadFrontPage():void;
        function get _Str_3961():Boolean;
        function _Str_5719(_arg_1:int, _arg_2:Boolean=false):Vector.<ICatalogNode>;
        function getNodeByName(_arg_1:String):ICatalogNode;
        function getOptionalNodeByName(_arg_1:String):ICatalogNode;
        function getNodeById(_arg_1:int, _arg_2:ICatalogNode=null):ICatalogNode;
        function openPage(_arg_1:String):void;
        function openPageById(_arg_1:int, _arg_2:int):void;
        function openPageByOfferId(_arg_1:int):void;
        function deactivateCurrentNode():void;
        function filter(_arg_1:String, _arg_2:Array):void;
        function get listTemplate():IWindow;
        function getItemTemplate(_arg_1:int):IWindow;
        function get isDeepHierarchy():Boolean;
    }
}
