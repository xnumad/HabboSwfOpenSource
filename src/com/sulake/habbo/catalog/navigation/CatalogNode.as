package com.sulake.habbo.catalog.navigation
{
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.catalog.NodeData;
    import __AS3__.vec.*;

    public class CatalogNode implements ICatalogNode 
    {
        private static const ICON_:String = "icon_";

        private var _depth:int = 0;
        private var _localization:String = "";
        private var _pageId:int = -1;
        private var _pageName:String = "";
        private var _iconId:int = 0;
        private var _children:Vector.<ICatalogNode>;
        private var _offerIds:Vector.<int>;
        private var _navigator:ICatalogNavigator;
        private var _parent:ICatalogNode;

        public function CatalogNode(k:ICatalogNavigator, _arg_2:NodeData, _arg_3:int, _arg_4:ICatalogNode)
        {
            this._depth = _arg_3;
            this._parent = _arg_4;
            this._navigator = k;
            this._localization = _arg_2.localization;
            this._pageId = _arg_2.pageId;
            this._pageName = _arg_2.pageName;
            this._iconId = _arg_2.icon;
            this._children = new Vector.<ICatalogNode>(0);
            this._offerIds = _arg_2.pageOffers;
        }

        public function get isOpen():Boolean
        {
            return false;
        }

        public function get depth():int
        {
            return this._depth;
        }

        public function get isBranch():Boolean
        {
            return this._children.length > 0;
        }

        public function get isLeaf():Boolean
        {
            return this._children.length == 0;
        }

        public function get visible():Boolean
        {
            return false;
        }

        public function get localization():String
        {
            return this._localization;
        }

        public function get pageId():int
        {
            return this._pageId;
        }

        public function get pageName():String
        {
            return this._pageName;
        }

        public function get children():Vector.<ICatalogNode>
        {
            return this._children;
        }

        public function get offerIds():Vector.<int>
        {
            return this._offerIds;
        }

        public function get navigator():ICatalogNavigator
        {
            return this._navigator;
        }

        public function get parent():ICatalogNode
        {
            return this._parent;
        }

        public function set parent(k:ICatalogNode):void
        {
        }

        public function dispose():void
        {
            var k:ICatalogNode;
            for each (k in this._children)
            {
                k.dispose();
            }
            this._children = null;
            this._offerIds = null;
            this._navigator = null;
            this._parent = null;
            this._pageName = "";
            this._localization = "";
        }

        public function addChild(k:ICatalogNode):void
        {
            if (k == null)
            {
                return;
            }
            this._children.push(k);
        }

        public function activate():void
        {
        }

        public function deactivate():void
        {
        }

        public function open():void
        {
        }

        public function close():void
        {
        }

        public function get _Str_4856():String
        {
            if (this._iconId < 1)
            {
                return "";
            }
            return ICON_ + this._iconId.toString();
        }

        public function get offsetV():int
        {
            return 0;
        }
    }
}
