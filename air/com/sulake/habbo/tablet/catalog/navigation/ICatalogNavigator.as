//com.sulake.habbo.tablet.catalog.navigation.ICatalogNavigator

package com.sulake.habbo.tablet.catalog.navigation{
    import com.sulake.habbo.tablet.catalog.IHabboTabletCatalog;
    import com.sulake.habbo.communication.messages.incoming.catalog.NodeData;
    import __AS3__.vec.Vector;

    public /*dynamic*/ interface ICatalogNavigator {

        function dispose():void;
        function get catalog():IHabboTabletCatalog;
        function buildIndex(k:NodeData):void;
        function loadFrontPage():void;
        function get initialized():Boolean;
        function getNodesByOfferId(k:int):Vector.<ICatalogNode>;
        function getNodeByName(k:String):ICatalogNode;
        function getOptionalNodeByName(k:String):ICatalogNode;
        function getNodeById(k:int, _arg_2:ICatalogNode=null):ICatalogNode;
        function openPage(k:String):void;
        function openPageById(k:int, _arg_2:int):void;
        function openPageByOfferId(k:int):void;
        function filter(k:String):Vector.<ICatalogNode>;
        function get rootNode():ICatalogNode;

    }
}//package com.sulake.habbo.tablet.catalog.navigation

