package com.sulake.habbo.catalog.navigation
{
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.ITabContextWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import __AS3__.vec.Vector;
    import flash.utils.Dictionary;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.catalog.TopViewSelector;
    import com.sulake.habbo.communication.messages.incoming.catalog.NodeData;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.catalog.navigation.events.CatalogPageOpenedEvent;
    import com.sulake.habbo.catalog.event.CatalogEvent;
    import com.sulake.core.runtime.Component;
    import __AS3__.vec.*;

    public class CatalogNavigator implements ICatalogNavigator 
    {
        public static const _Str_5778:int = -12345678;

        private var _catalog:HabboCatalog;
        private var _container:IWindowContainer;
        private var _catalogType:String;
        private var _tabs:ITabContextWindow;
        private var _list:IItemListWindow;
        private var _index:ICatalogNode;
        private var _currentNodes:Vector.<ICatalogNode>;
        private var _offersToNodes:Dictionary;
        private var _topItemTemplate:IWindow;
        private var _subItemTemplate:IWindow;
        private var _listTemplate:IWindow;
        private var _topViewSelector:TopViewSelector;

        public function CatalogNavigator(k:HabboCatalog, _arg_2:IWindowContainer, _arg_3:String)
        {
            this._catalog = k;
            this._container = _arg_2;
            this._catalogType = _arg_3;
            this._currentNodes = new Vector.<ICatalogNode>(0);
            this._list = (this._container.findChildByName("navigationList") as IItemListWindow);
            this._topItemTemplate = this._list.removeListItem(this._list.getListItemByName((_arg_3.toLowerCase() + "_topitem_template")));
            this._subItemTemplate = this._list.removeListItem(this._list.getListItemByName((_arg_3.toLowerCase() + "_subitem_template")));
            this._listTemplate = this._list.removeListItem(this._list.getListItemByName((_arg_3.toLowerCase() + "_list_template")));
            this._tabs = ITabContextWindow(this._container.findChildByName("tab_context"));
            if (this._tabs != null)
            {
                if (this._catalog.useNonTabbedCatalog())
                {
                    this._tabs.visible = false;
                }
                else
                {
                    this._topViewSelector = new TopViewSelector(this, this._tabs);
                }
            }
        }

        private static function _Str_12923(searchTerm:String, potentialPageMatches:Array, node:ICatalogNode, nodes:Vector.<ICatalogNode>):void
        {
            var child:ICatalogNode;
            var nodeAdded:Boolean;
            var hayStack:String;
            var furnitureLine:String;
            try
            {
                if (((node.visible) && (node.pageId > 0)))
                {
                    nodeAdded = false;
                    hayStack = [node.pageName, node.localization].join(" ").toLowerCase();
                    hayStack = hayStack.replace(/ /gi, "");
                    if (hayStack.indexOf(searchTerm) > -1)
                    {
                        nodes.push(node);
                        nodeAdded = true;
                    }
                    if (!nodeAdded)
                    {
                        for each (furnitureLine in potentialPageMatches)
                        {
                            if (hayStack.indexOf(furnitureLine) >= 0)
                            {
                                nodes.push(node);
                                break;
                            }
                        }
                    }
                }
                for each (child in node.children)
                {
                    _Str_12923(searchTerm, potentialPageMatches, child, nodes);
                }
            }
            catch(e:Error)
            {
                Logger.log((("Error when loading nodes by name " + searchTerm) + ":"), e);
            }
        }


        public function get _Str_3961():Boolean
        {
            return !(this._index == null);
        }

        public function dispose():void
        {
            if (this._index != null)
            {
                this._index.dispose();
            }
            this._index = null;
            this._offersToNodes = null;
            this._currentNodes = null;
            this._catalog = null;
            this._container = null;
            this._list = null;
        }

        public function buildCatalogIndex(k:NodeData):void
        {
            this._index = null;
            this._offersToNodes = new Dictionary();
            this._index = this._Str_20450(k, 0, null);
        }

        public function showIndex():void
        {
            var k:ICatalogNode;
            if (this._index == null)
            {
                return;
            }
            this._list.removeListItems();
            if (this._topViewSelector != null)
            {
                this._topViewSelector._Str_17441();
            }
            for each (k in this._index.children)
            {
                if (k.visible)
                {
                    if (this._catalog.useNonTabbedCatalog())
                    {
                        (k as CatalogNodeRenderable)._Str_11512(this._list);
                    }
                    else
                    {
                        this._topViewSelector._Str_5377(k);
                    }
                }
            }
            if (this._topViewSelector != null)
            {
                this._topViewSelector._Str_12925(0);
            }
        }

        public function _Str_20996(k:ICatalogNode):void
        {
            var _local_2:ICatalogNode;
            if (this._index == null)
            {
                return;
            }
            this._list.removeListItems();
            if (((k == null) || (!(k.visible))))
            {
                return;
            }
            if (k.children.length)
            {
                for each (_local_2 in k.children)
                {
                    if (_local_2.visible)
                    {
                        (_local_2 as CatalogNodeRenderable)._Str_11512(this._list);
                    }
                }
                this.activateNode(k.children[0]);
            }
            else
            {
                this.openCatalogPage(k);
            }
        }

        private function _Str_25171(k:ICatalogNode):ICatalogNode
        {
            var _local_3:int;
            var _local_2:ICatalogNode = k.parent;
            while ((((!(_local_2 == null)) && (!(_local_2.parent == null))) && (!(_local_2.parent.pageName == "root"))))
            {
                _local_2 = _local_2.parent;
            }
            if (((this._topViewSelector) && (_local_2.parent)))
            {
                _local_3 = _local_2.parent.children.indexOf(_local_2);
                this._topViewSelector._Str_12925(_local_3);
            }
            this._Str_20996(_local_2);
            return _local_2;
        }

        public function get catalog():IHabboCatalog
        {
            return this._catalog;
        }

        public function activateNode(k:ICatalogNode):void
        {
            var _local_5:ICatalogNode;
            var _local_6:Number;
            var _local_7:Number;
            var _local_8:int;
            var _local_2:* = (this._currentNodes.indexOf(k) >= 0);
            var _local_3:Boolean = k.isOpen;
            var _local_4:Vector.<ICatalogNode> = new Vector.<ICatalogNode>(0);
            for each (_local_5 in this._currentNodes)
            {
                _local_5.deactivate();
                if (_local_5.depth < k.depth)
                {
                    _local_4.push(_local_5);
                }
                else
                {
                    _local_5.close();
                }
            }
            this._currentNodes = _local_4;
            k.activate();
            if (((_local_2) && (_local_3)))
            {
                k.close();
            }
            else
            {
                k.open();
            }
            if (this._currentNodes.indexOf(k) < 0)
            {
                this._currentNodes.push(k);
            }
            if (k.isBranch)
            {
                if (((k.parent) && (k.parent is CatalogNodeRenderable)))
                {
                    (k.parent as CatalogNodeRenderable)._Str_21669();
                }
                _local_6 = 0;
                _local_7 = 0;
                _local_8 = 0;
                while (_local_8 < this._list.numListItems)
                {
                    if (this._list.getListItemAt(_local_8).visible)
                    {
                        _local_7 = (_local_7 + this._list.getListItemAt(_local_8).height);
                    }
                    _local_8++;
                }
                for each (k in this._currentNodes)
                {
                    _local_6 = (_local_6 + k.offsetV);
                }
                if ((_local_6 - this._list.height) > 0)
                {
                    this._list.scrollV = (_local_6 / _local_7);
                }
            }
            if (k.pageId > -1)
            {
                this.openCatalogPage(k);
            }
        }

        private function openCatalogPage(k:ICatalogNode):void
        {
            this._catalog.loadCatalogPage(k.pageId, -1, this._catalogType);
            this._catalog.events.dispatchEvent(new CatalogPageOpenedEvent(k.pageId, k.localization));
        }

        public function openPage(k:String):void
        {
            var _local_2:ICatalogNode = this.getNodeByName(k);
            if (((!(_local_2 == null)) && (_local_2.visible)))
            {
                this._catalog.loadCatalogPage(_local_2.pageId, -1, this._catalogType);
                this._Str_18195(_local_2);
            }
            else
            {
                if (((!(_local_2 == null)) && (!(_local_2.visible))))
                {
                    this._catalog.events.dispatchEvent(new CatalogEvent(CatalogEvent.CATALOG_INVISIBLE_PAGE_VISITED));
                }
                this.loadFrontPage();
            }
        }

        public function openPageById(k:int, _arg_2:int):void
        {
            var _local_3:ICatalogNode;
            var _local_4:Vector.<ICatalogNode>;
            if (!this._Str_3961)
            {
                this._catalog.openCatalogPageById(k, _arg_2, this._catalogType);
            }
            else
            {
                if (k == _Str_5778)
                {
                    _local_4 = this._Str_5719(_arg_2, true);
                    if (_local_4 != null)
                    {
                        _local_3 = _local_4[0];
                    }
                }
                else
                {
                    _local_3 = this.getNodeById(k);
                }
                if (_local_3 != null)
                {
                    this._catalog.loadCatalogPage(_local_3.pageId, _arg_2, this._catalogType);
                    this._Str_18195(_local_3);
                }
            }
        }

        public function openPageByOfferId(k:int):void
        {
            var _local_2:Vector.<ICatalogNode>;
            var _local_3:ICatalogNode;
            if (!this._Str_3961)
            {
                this._catalog.openCatalogPageById(_Str_5778, k, this._catalogType);
            }
            else
            {
                _local_2 = this._Str_5719(k);
                if (_local_2 != null)
                {
                    _local_3 = _local_2[0];
                    this._catalog.loadCatalogPage(_local_3.pageId, k, this._catalogType);
                    this._Str_18195(_local_3);
                }
            }
        }

        public function deactivateCurrentNode():void
        {
            var k:ICatalogNode;
            for each (k in this._currentNodes)
            {
                k.deactivate();
                k.close();
            }
            this._currentNodes = new Vector.<ICatalogNode>(0);
        }

        public function filter(k:String, _arg_2:Array):void
        {
            var _local_4:ICatalogNode;
            var _local_3:Vector.<ICatalogNode> = new Vector.<ICatalogNode>(0);
            _Str_12923(k, _arg_2, this._index, _local_3);
            this._list.removeListItems();
            for each (_local_4 in _local_3)
            {
                Logger.log(("Found node: " + [_local_4.pageId, _local_4.pageName, _local_4.localization]));
                if (_local_4.visible)
                {
                    (_local_4 as CatalogNodeRenderable)._Str_11512(this._list);
                }
            }
        }

        private function _Str_18195(k:ICatalogNode):void
        {
            if (k == null)
            {
                return;
            }
            this.deactivateCurrentNode();
            var _local_2:ICatalogNode = k.parent;
            while (((!(_local_2 == null)) && (!(_local_2.parent == null))))
            {
                _local_2.open();
                if (this._catalog.useNonTabbedCatalog())
                {
                    this._currentNodes.push(_local_2);
                }
                _local_2 = _local_2.parent;
            }
            if (!this._catalog.useNonTabbedCatalog())
            {
                this._Str_25171(k);
            }
            this.activateNode(k);
        }

        public function loadFrontPage():void
        {
            if (this._index == null)
            {
                return;
            }
            var k:ICatalogNode = this._Str_19504(this._index);
            if (k == null)
            {
                return;
            }
            Logger.log((((("Load front page: " + k.localization) + "(") + k.pageId) + ")"));
            this._catalog.loadCatalogPage(k.pageId, -1, this._catalogType);
        }

        private function _Str_19504(k:ICatalogNode):ICatalogNode
        {
            var _local_2:ICatalogNode;
            var _local_3:ICatalogNode;
            if (((k.visible) && (!(k == this._index))))
            {
                return k;
            }
            for each (_local_2 in k.children)
            {
                _local_3 = this._Str_19504(_local_2);
                if (_local_3 != null)
                {
                    return _local_3;
                }
            }
            return null;
        }

        private function _Str_20450(k:NodeData, _arg_2:int, _arg_3:ICatalogNode):ICatalogNode
        {
            var _local_5:ICatalogNode;
            var _local_6:int;
            var _local_7:NodeData;
            var _local_4:Boolean = k.visible;
            if (!_local_4)
            {
                _local_5 = new CatalogNode(this, k, _arg_2, _arg_3);
            }
            else
            {
                _local_5 = new CatalogNodeRenderable(this, k, _arg_2, _arg_3);
            }
            for each (_local_6 in _local_5.offerIds)
            {
                if ((_local_6 in this._offersToNodes))
                {
                    this._offersToNodes[_local_6].push(_local_5);
                }
                else
                {
                    this._offersToNodes[_local_6] = new <ICatalogNode>[_local_5];
                }
            }
            _arg_2++;
            for each (_local_7 in k.children)
            {
                _local_5.addChild(this._Str_20450(_local_7, _arg_2, _local_5));
            }
            return _local_5;
        }

        public function _Str_5719(k:int, _arg_2:Boolean=false):Vector.<ICatalogNode>
        {
            var _local_3:Vector.<ICatalogNode>;
            var _local_4:ICatalogNode;
            if (this._offersToNodes != null)
            {
                if (_arg_2)
                {
                    _local_3 = new Vector.<ICatalogNode>(0);
                    for each (_local_4 in this._offersToNodes[k])
                    {
                        if (_local_4.visible)
                        {
                            _local_3.push(_local_4);
                        }
                    }
                    if (_local_3.length > 0)
                    {
                        return _local_3;
                    }
                    return null;
                }
                return this._offersToNodes[k];
            }
            return null;
        }

        public function getNodeByName(k:String):ICatalogNode
        {
            return (this._index != null) ? this._Str_16317(k, this._index) : null;
        }

        public function getOptionalNodeByName(k:String):ICatalogNode
        {
            return (this._index) ? this._Str_16317(k, this._index) : null;
        }

        public function getNodeById(k:int, _arg_2:ICatalogNode=null):ICatalogNode
        {
            var _local_4:ICatalogNode;
            if (_arg_2 == null)
            {
                _arg_2 = this._index;
            }
            if (!(!(_arg_2 == null)))
            {
                return null;
            }
            var _local_3:ICatalogNode;
            if (((_arg_2.pageId == k) && (!(_arg_2 == this._index))))
            {
                _local_3 = _arg_2;
            }
            else
            {
                for each (_local_4 in _arg_2.children)
                {
                    _local_3 = this.getNodeById(k, _local_4);
                    if (_local_3 != null)
                    {
                        break;
                    }
                }
            }
            return _local_3;
        }

        private function _Str_16317(pageName:String, node:ICatalogNode):ICatalogNode
        {
            var child:ICatalogNode;
            var found:ICatalogNode;
            try
            {
                if (((node.pageName == pageName) && (!(node == this._index))))
                {
                    found = node;
                }
                else
                {
                    for each (child in node.children)
                    {
                        found = this._Str_16317(pageName, child);
                        if (found != null)
                        {
                            break;
                        }
                    }
                }
            }
            catch(e:Error)
            {
                Logger.log((("Error when loading node by name " + pageName) + ":"), e);
            }
            return found;
        }

        public function get listTemplate():IWindow
        {
            return this._listTemplate;
        }

        public function get isDeepHierarchy():Boolean
        {
            return (this._catalog as Component).getBoolean("catalog.deep.hierarchy");
        }

        public function getItemTemplate(k:int):IWindow
        {
            if (this.isDeepHierarchy)
            {
                return (k > 2) ? this._subItemTemplate : this._topItemTemplate;
            }
            return (k == 1) ? this._topItemTemplate : this._subItemTemplate;
        }
    }
}
