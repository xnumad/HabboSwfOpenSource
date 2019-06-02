package com.sulake.habbo.ui.widget.doorbell
{
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class DoorbellView 
    {
        private var _doorbell:DoorbellWidget;
        private var _frame:IFrameWindow;
        private var _list:IItemListWindow;

        public function DoorbellView(k:DoorbellWidget)
        {
            this._doorbell = k;
        }

        public function dispose():void
        {
            this._list = null;
            this._doorbell = null;
            if (this._frame)
            {
                this._frame.dispose();
                this._frame = null;
            }
        }

        public function update():void
        {
            var k:int;
            if (this._doorbell.users.length == 0)
            {
                this.hide();
                return;
            }
            if (this._frame == null)
            {
                this._Str_7718();
            }
            this._frame.visible = true;
            if (this._list != null)
            {
                this._list.destroyListItems();
                k = 0;
                while (k < this._doorbell.users.length)
                {
                    this._list.addListItem(this._Str_6850((this._doorbell.users[k] as String), k));
                    k++;
                }
            }
        }

        public function get mainWindow():IWindow
        {
            return this._frame;
        }

        private function _Str_6850(k:String, _arg_2:int):IWindow
        {
            var _local_6:IWindow;
            var _local_3:XmlAsset = (this._doorbell.assets.getAssetByName("doorbell_list_entry") as XmlAsset);
            var _local_4:IWindowContainer = (this._doorbell.windowManager.buildFromXML((_local_3.content as XML)) as IWindowContainer);
            if (_local_4 == null)
            {
                throw (new Error("Failed to construct window from XML!"));
            }
            var _local_5:ITextWindow = (_local_4.findChildByName("user_name") as ITextWindow);
            if (_local_5 != null)
            {
                _local_5.caption = k;
            }
            _local_4.name = k;
            if ((_arg_2 % 2) == 0)
            {
                _local_4.color = 0xFFFFFFFF;
            }
            _local_6 = _local_4.findChildByName("accept");
            if (_local_6 != null)
            {
                _local_6.addEventListener(WindowMouseEvent.CLICK, this._Str_2608);
            }
            _local_6 = _local_4.findChildByName("deny");
            if (_local_6 != null)
            {
                _local_6.addEventListener(WindowMouseEvent.CLICK, this._Str_2608);
            }
            return _local_4;
        }

        private function hide():void
        {
            if (this._frame)
            {
                this._frame.dispose();
                this._frame = null;
            }
        }

        private function _Str_7718():void
        {
            if (this._frame != null)
            {
                return;
            }
            var k:XmlAsset = (this._doorbell.assets.getAssetByName("doorbell") as XmlAsset);
            this._frame = (this._doorbell.windowManager.buildFromXML((k.content as XML)) as IFrameWindow);
            if (this._frame == null)
            {
                throw (new Error("Failed to construct window from XML!"));
            }
            this._list = (this._frame.findChildByName("user_list") as IItemListWindow);
            this._frame.visible = false;
            var _local_2:IWindow = this._frame.findChildByTag("close");
            if (_local_2 != null)
            {
                _local_2.addEventListener(WindowMouseEvent.CLICK, this.onCloseHandler);
            }
        }

        private function onCloseHandler(k:WindowMouseEvent):void
        {
            this._doorbell._Str_23961();
        }

        private function _Str_2608(k:WindowMouseEvent):void
        {
            var _local_2:String = k.window.parent.name;
            switch (k.window.name)
            {
                case "accept":
                    this._doorbell.accept(_local_2);
                    return;
                case "deny":
                    this._doorbell.deny(_local_2);
                    return;
            }
        }
    }
}

