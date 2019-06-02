//com.sulake.habbo.catalog.navigation.ICatalogNavigator

package com.sulake.habbo.catalog.navigation{
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.communication.messages.incoming.catalog.NodeData;
    import __AS3__.vec.Vector;
    import com.sulake.core.window.IWindow;

    public /*dynamic*/ interface ICatalogNavigator {

        function dispose():void;
        function get catalog():IHabboCatalog;
        function buildCatalogIndex(k:NodeData):void;
        function showIndex():void;
        function activateNode(k:ICatalogNode):void;
        function loadFrontPage():void;
        function get initialized():Boolean;
        function getNodesByOfferId(k:int):Vector.<ICatalogNode>;
        function getNodeByName(k:String):ICatalogNode;
        function getOptionalNodeByName(k:String):ICatalogNode;
        function getNodeById(k:int, _arg_2:ICatalogNode=null):ICatalogNode;
        function openPage(k:String):void;
        function openPageById(k:int, _arg_2:int):void;
        function openPageByOfferId(k:int):void;
        function deactivateCurrentNode():void;
        function filter(k:String):void;
        function get listTemplate():IWindow;
        function getItemTemplate(k:int):IWindow;

    }
}//package com.sulake.habbo.catalog.navigation

