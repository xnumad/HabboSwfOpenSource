//com.sulake.habbo.tablet.catalog.navigation.CatalogNode

package com.sulake.habbo.tablet.catalog.navigation{
    import com.sulake.feathers.controls.IAccordionItemData;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.catalog.NodeData;

    public class CatalogNode implements ICatalogNode, IAccordionItemData {

        private static const ICON_PREFIX:String;

        private var _depth:int;
        private var _localization:String;
        private var _pageId:int;
        private var _pageName:String;
        private var _iconId:int;
        private var _iconUrl:String;
        private var _children:Vector.<ICatalogNode>;
        private var _offerIds:Vector.<int>;
        private var _parent:ICatalogNode;
        private var _visible:Boolean;

        public function CatalogNode(k:NodeData, _arg_2:int, _arg_3:ICatalogNode);

        public function get depth():int;

        public function get visible():Boolean;

        public function set visible(k:Boolean):void;

        public function get pageId():int;

        public function get pageName():String;

        public function get children():Vector.<ICatalogNode>;

        public function get offerIds():Vector.<int>;

        public function get parent():ICatalogNode;

        public function set parent(k:ICatalogNode):void;

        public function dispose():void;

        public function addChild(k:ICatalogNode):void;

        public function get iconName():String;

        public function get id():int;

        public function get label():String;

        public function get iconSource():Object;

        public function set iconUrl(k:String):void;

        public function get childDataItems():Vector.<IAccordionItemData>;


    }
}//package com.sulake.habbo.tablet.catalog.navigation

