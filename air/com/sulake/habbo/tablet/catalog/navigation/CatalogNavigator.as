//com.sulake.habbo.tablet.catalog.navigation.CatalogNavigator

package com.sulake.habbo.tablet.catalog.navigation{
    import __AS3__.vec.Vector;
    import com.sulake.habbo.tablet.catalog.IHabboTabletCatalog;
    import flash.utils.Dictionary;
    import com.sulake.habbo.communication.messages.incoming.catalog.NodeData;

    public class CatalogNavigator implements ICatalogNavigator {

        public static const DUMMY_PAGE_ID_FOR_OFFER_SEARCH:int;
        public static const IN_APP_PURCHASES_PAGE_NAME:String;
        private static const RESTRICTED_NODES:Vector.<String>;

        private var _catalog:IHabboTabletCatalog;
        private var _catalogType:String;
        private var _root:ICatalogNode;
        private var _hiddenNodes:Vector.<ICatalogNode>;
        private var _offersToNodes:Dictionary;

        public function CatalogNavigator(k:IHabboTabletCatalog, _arg_2:String);

        private static function searchNodesWith(k:String, _arg_2:ICatalogNode, _arg_3:Vector.<ICatalogNode>):void;


        public function get initialized():Boolean;

        public function dispose():void;

        public function buildIndex(k:NodeData):void;

        public function get catalog():IHabboTabletCatalog;

        public function openPage(k:String):void;

        public function openPageById(k:int, _arg_2:int):void;

        public function openPageByOfferId(k:int):void;

        public function filter(k:String):Vector.<ICatalogNode>;

        public function loadFrontPage():void;

        private function getFirstNavigable(k:ICatalogNode):ICatalogNode;

        private function nodeIconUrl(k:String):String;

        private function build(k:NodeData, _arg_2:int, _arg_3:ICatalogNode, _arg_4:Vector.<ICatalogNode>, _arg_5:Dictionary):ICatalogNode;

        public function getNodesByOfferId(k:int):Vector.<ICatalogNode>;

        public function getNodeByName(k:String):ICatalogNode;

        public function getOptionalNodeByName(k:String):ICatalogNode;

        public function getNodeById(k:int, _arg_2:ICatalogNode=null):ICatalogNode;

        private function getFirstNodeByName(k:String, _arg_2:ICatalogNode):ICatalogNode;

        public function get rootNode():ICatalogNode;


    }
}//package com.sulake.habbo.tablet.catalog.navigation

