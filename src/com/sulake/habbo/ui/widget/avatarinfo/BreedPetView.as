package com.sulake.habbo.ui.widget.avatarinfo
{
    import com.sulake.habbo.ui.widget.events._Str_3858;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class BreedPetView extends AvatarContextInfoButtonView 
    {
        private static const _Str_2906:int = 0;

        private var _mode:int;
        private var _useProductItem:_Str_3858;
        private var _canBreed:Boolean;

        public function BreedPetView(k:AvatarInfoWidget)
        {
            super(k);
            _Str_3403 = false;
        }

        public static function setup(k:BreedPetView, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:int, _arg_6:_Str_3858, _arg_7:Boolean):void
        {
            k._useProductItem = _arg_6;
            k._canBreed = _arg_7;
            AvatarContextInfoButtonView.setup(k, _arg_2, _arg_3, _arg_4, _arg_5, false);
        }


        public function get _Str_1577():int
        {
            return this._useProductItem.id;
        }

        public function get _Str_3710():int
        {
            return this._useProductItem._Str_3710;
        }

        override public function dispose():void
        {
            if (window)
            {
                window.removeEventListener(WindowMouseEvent.OVER, _Str_2743);
                window.removeEventListener(WindowMouseEvent.OUT, _Str_2743);
            }
            if (this._useProductItem)
            {
                this._useProductItem.dispose();
            }
            this._useProductItem = null;
            super.dispose();
        }

        private function _Str_18845():void
        {
            var k:int = this.widget.handler.roomSession.roomId;
            this._mode = _Str_2906;
        }

        override protected function updateWindow():void
        {
            var k:XML;
            if ((((!(_Str_2268)) || (!(_Str_2268.assets))) || (!(_Str_2268.windowManager))))
            {
                return;
            }
            this._Str_18845();
            if (_Str_3452)
            {
                activeView = _Str_3113();
            }
            else
            {
                if (!window)
                {
                    k = (XmlAsset(_Str_2268.assets.getAssetByName("breed_pet_menu")).content as XML);
                    _window = (_Str_2268.windowManager.buildFromXML(k, 0) as IWindowContainer);
                    if (!window)
                    {
                        return;
                    }
                    _window.addEventListener(WindowMouseEvent.OVER, _Str_2743);
                    _window.addEventListener(WindowMouseEvent.OUT, _Str_2743);
                    _window.findChildByName("minimize").addEventListener(WindowMouseEvent.CLICK, _Str_4457);
                    _window.findChildByName("minimize").addEventListener(WindowMouseEvent.OVER, _Str_3052);
                    _window.findChildByName("minimize").addEventListener(WindowMouseEvent.OUT, _Str_3052);
                }
                _Str_2374 = (window.findChildByName("buttons") as IItemListWindow);
                _Str_2374.procedure = this.buttonEventProc;
                _window.findChildByName("name").caption = _Str_2360;
                _window.visible = false;
                activeView = _window;
                this._Str_2771();
            }
        }

        public function _Str_2771():void
        {
            if (((!(_window)) || (!(_Str_2374))))
            {
                return;
            }
            _Str_2374.autoArrangeItems = false;
            var k:int = _Str_2374.numListItems;
            var _local_2:int;
            while (_local_2 < k)
            {
                _Str_2374.getListItemAt(_local_2).visible = false;
                _local_2++;
            }
            switch (this._mode)
            {
                case _Str_2906:
                    if (this._canBreed)
                    {
                        _Str_2304("breed");
                    }
                    break;
            }
            _Str_2374.autoArrangeItems = true;
            _Str_2374.visible = true;
        }

        override protected function buttonEventProc(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_4:RoomWidgetMessage;
            if (disposed)
            {
                return;
            }
            if (((!(_window)) || (_window.disposed)))
            {
                return;
            }
            var _local_3:Boolean;
            if (k.type == WindowMouseEvent.CLICK)
            {
                if (_arg_2.name == "button")
                {
                    _local_3 = true;
                    switch (_arg_2.parent.name)
                    {
                        case "breed":
                            this.widget._Str_16495(this._useProductItem._Str_3710, this._useProductItem._Str_5563, false);
                            break;
                    }
                }
                if (_local_4)
                {
                    _Str_2268.messageListener.processWidgetMessage(_local_4);
                }
            }
            else
            {
                super.buttonEventProc(k, _arg_2);
            }
            if (_local_3)
            {
                this.widget._Str_11447();
            }
        }

        private function _Str_6337(k:int):void
        {
            this._mode = k;
            this._Str_2771();
        }

        private function get widget():AvatarInfoWidget
        {
            return _Str_2268 as AvatarInfoWidget;
        }
    }
}



