package com.sulake.habbo.catalog.navigation
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.communication.messages.incoming.catalog.NodeData;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.window.enum._Str_8057;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class CatalogNodeRenderable extends CatalogNode 
    {
        private static const _Str_17404:Number = 0xFFFFFFFF;

        private var _window:IWindowContainer;
        private var _childList:IItemListWindow;
        private var _isOpen:Boolean = false;
        private var _active:Boolean;
        private var _itemNormalColor:uint;
        private var _itemSelectedEtchingColor:uint;

        public function CatalogNodeRenderable(k:ICatalogNavigator, _arg_2:NodeData, _arg_3:int, _arg_4:ICatalogNode)
        {
            super(k, _arg_2, _arg_3, _arg_4);
        }

        public function get window():IWindowContainer
        {
            return this._window;
        }

        override public function get isOpen():Boolean
        {
            return this._isOpen;
        }

        override public function get visible():Boolean
        {
            return true;
        }

        override public function dispose():void
        {
            if (this._isOpen)
            {
                this.close();
                this.deactivate();
            }
            this._window = null;
            this._childList = null;
            super.dispose();
        }

        public function _Str_11512(k:IItemListWindow, _arg_2:Boolean=true):void
        {
            if (this._window == null)
            {
                this.createWindow();
                this._Str_14783();
            }
            k.addListItem(this._window);
            if (isBranch)
            {
                if (this._childList == null)
                {
                    this._Str_19530();
                }
                k.addListItem(this._childList);
                this._Str_23363();
            }
            k.arrangeListItems();
        }

        public function _Str_19623(k:IItemListWindow):void
        {
            k.removeListItem(this._window);
            if (isBranch)
            {
                k.removeListItem(this._childList);
            }
        }

        override public function activate():void
        {
            this._Str_21224();
            this._active = true;
        }

        override public function deactivate():void
        {
            this._Str_14783();
            this._active = false;
        }

        override public function open():void
        {
            var k:IWindow;
            this._Str_21358();
            this._isOpen = true;
            if (((isBranch) && (!(this._window == null))))
            {
                k = this._window.findChildByTag("DOWNBTN");
                if (k != null)
                {
                    k.style = _Str_8057._Str_17212;
                }
            }
        }

        override public function close():void
        {
            var k:IWindow;
            this._Str_19979();
            this._isOpen = false;
            if (((isBranch) && (!(this._window == null))))
            {
                k = this._window.findChildByTag("DOWNBTN");
                if (k != null)
                {
                    k.style = _Str_8057._Str_17556;
                }
            }
        }

        private function _Str_23363():void
        {
            var k:ICatalogNode;
            var _local_2:CatalogNodeRenderable;
            if (this._childList == null)
            {
                return;
            }
            for each (k in children)
            {
                _local_2 = (k as CatalogNodeRenderable);
                if (_local_2 != null)
                {
                    if (_local_2.visible)
                    {
                        _local_2._Str_11512(this._childList);
                        _local_2._Str_14783();
                    }
                    else
                    {
                        _local_2._Str_19623(this._childList);
                    }
                }
            }
            this._childList.arrangeListItems();
        }

        private function _Str_21358():void
        {
            var k:ICatalogNode;
            var _local_2:int;
            var _local_3:int;
            if (this._childList == null)
            {
                this._Str_19530();
            }
            for each (k in children)
            {
                if (k.visible)
                {
                    (k as CatalogNodeRenderable)._Str_11512(this._childList);
                }
            }
            if (this._childList != null)
            {
                this._childList.visible = true;
                _local_2 = 0;
                _local_3 = 0;
                while (_local_3 < this._childList.numListItems)
                {
                    if (this._childList.getListItemAt(_local_3).visible)
                    {
                        _local_2++;
                    }
                    _local_3++;
                }
                this._childList.height = (_local_2 * 21);
            }
        }

        private function _Str_19979():void
        {
            var k:ICatalogNode;
            for each (k in children)
            {
                if (k.visible)
                {
                    (k as CatalogNodeRenderable)._Str_19623(this._childList);
                }
            }
            if (this._childList != null)
            {
                this._childList.height = 0;
                this._childList.visible = false;
                this._childList.x = 0;
            }
        }

        private function _Str_19530():void
        {
            this._childList = (navigator.listTemplate.clone() as IItemListWindow);
            this._Str_19979();
        }

        private function createWindow():void
        {
            this._window = (navigator.getItemTemplate(depth).clone() as IWindowContainer);
            var k:ITextWindow = (this._window.findChildByTag("ITEM_TITLE") as ITextWindow);
            var _local_2:IWindow = this._window.findChildByTag("DOWNBTN");
            if (k != null)
            {
                k.caption = localization;
                this._itemNormalColor = k.textColor;
                this._itemSelectedEtchingColor = k.etchingColor;
            }
            var _local_3:IWindow = this._window.findChildByTag("SELECTION_HILIGHT");
            if (_local_3)
            {
                _local_3.visible = false;
            }
            if (_local_2 != null)
            {
                _local_2.visible = (!(isLeaf));
            }
            IStaticBitmapWrapperWindow(this._window.findChildByName("icon")).assetUri = ((navigator.catalog.imageGalleryHost + _Str_4856) + ".png");
            if (navigator.isDeepHierarchy)
            {
                if (depth == 1)
                {
                    this._window.findChildByName("icon").visible = false;
                    this._window.findChildByTag("ITEM_TITLE").x = 0;
                }
                if (depth > 3)
                {
                    this._window.findChildByName("icon").visible = isBranch;
                    this._window.findChildByTag("ITEM_TITLE").x = (42 + (5 * (depth - 3)));
                }
            }
            this._window.addEventListener(WindowMouseEvent.CLICK, this._Str_2608);
            this._window.addEventListener(WindowMouseEvent.OVER, this._Str_23473);
            this._window.addEventListener(WindowMouseEvent.OUT, this._Str_25078);
            if (_local_2 != null)
            {
                _local_2.addEventListener(WindowMouseEvent.CLICK, this._Str_2608);
            }
        }

        private function _Str_25078(k:WindowMouseEvent):void
        {
            if (!this._active)
            {
                this._Str_14783();
            }
        }

        private function _Str_23473(k:WindowMouseEvent):void
        {
            if (!this._active)
            {
                this._Str_21224();
            }
        }

        private function _Str_14783():void
        {
            var k:ITextWindow;
            var _local_2:IWindow;
            if (this._window != null)
            {
                k = (this._window.findChildByTag("SELECTION_COLOR") as ITextWindow);
                if (k != null)
                {
                    k.textColor = this._itemNormalColor;
                    k.etchingColor = 0;
                }
                _local_2 = this._window.findChildByTag("SELECTION_HILIGHT");
                if (_local_2 != null)
                {
                    _local_2.visible = false;
                }
            }
        }

        private function _Str_21224():void
        {
            var k:ITextWindow;
            var _local_2:IWindowContainer;
            if (this._window != null)
            {
                k = (this._window.findChildByTag("SELECTION_COLOR") as ITextWindow);
                if (k != null)
                {
                    k.textColor = _Str_17404;
                    k.etchingColor = this._itemSelectedEtchingColor;
                }
                _local_2 = (this._window.findChildByTag("SELECTION_HILIGHT") as IWindowContainer);
                if (_local_2 != null)
                {
                    _local_2.visible = true;
                }
            }
        }

        private function _Str_2608(k:WindowMouseEvent):void
        {
            navigator.activateNode(this);
        }

        public function _Str_21669():void
        {
            var _local_2:int;
            if (this._childList == null)
            {
                return;
            }
            this._childList.height = 0;
            if (this._childList != null)
            {
                _local_2 = 0;
                while (_local_2 < this._childList.numListItems)
                {
                    if (this._childList.getListItemAt(_local_2).visible)
                    {
                        this._childList.height = (this._childList.height + this._childList.getListItemAt(_local_2).height);
                    }
                    _local_2++;
                }
            }
            var k:CatalogNodeRenderable = (parent as CatalogNodeRenderable);
            if (k)
            {
                k._Str_21669();
            }
        }

        override public function get offsetV():int
        {
            return this._window.y + 21;
        }
    }
}



