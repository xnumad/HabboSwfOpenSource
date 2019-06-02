package com.sulake.habbo.catalog.navigation
{
    import __AS3__.vec.Vector;

    public interface ICatalogNode 
    {
        function dispose():void;
        function get isOpen():Boolean;
        function get depth():int;
        function get isBranch():Boolean;
        function get isLeaf():Boolean;
        function get visible():Boolean;
        function get localization():String;
        function get pageId():int;
        function get pageName():String;
        function get children():Vector.<ICatalogNode>;
        function get offerIds():Vector.<int>;
        function activate():void;
        function deactivate():void;
        function addChild(_arg_1:ICatalogNode):void;
        function open():void;
        function close():void;
        function get parent():ICatalogNode;
        function get _Str_4856():String;
        function get offsetV():int;
    }
}
