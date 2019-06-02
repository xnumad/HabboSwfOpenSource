package com.sulake.habbo.ui.widget.avatarinfo
{
    import com.sulake.habbo.room.object.RoomObjectTypeEnum;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class DecorateModeView extends AvatarContextInfoButtonView 
    {
        public function DecorateModeView(k:AvatarInfoWidget, _arg_2:int, _arg_3:String, _arg_4:int)
        {
            super(k);
            _Str_3403 = false;
            AvatarContextInfoButtonView.setup(this, _arg_2, _arg_3, _arg_4, RoomObjectTypeEnum.HABBO);
        }

        override protected function updateWindow():void
        {
            var k:XML;
            if ((((!(_Str_2268)) || (!(_Str_2268.assets))) || (!(_Str_2268.windowManager))))
            {
                return;
            }
            if (!_window)
            {
                k = (XmlAsset(_Str_2268.assets.getAssetByName("own_avatar_decorating")).content as XML);
                _window = (_Str_2268.windowManager.buildFromXML(k, 0) as IWindowContainer);
                if (!_window)
                {
                    return;
                }
                _window.addEventListener(WindowMouseEvent.OVER, _Str_2743);
                _window.addEventListener(WindowMouseEvent.OUT, _Str_2743);
                _Str_2374 = (_window.findChildByName("buttons") as IItemListWindow);
                _Str_2374.procedure = this._Str_5162;
                this._Str_2771();
            }
            this.activeView = _window;
        }

        override public function show():void
        {
            if (_Str_3007 != null)
            {
                _Str_3007.visible = true;
                _Str_3007.activate();
            }
        }

        override public function hide(k:Boolean):void
        {
            if (_Str_3007 != null)
            {
                _Str_3007.visible = false;
            }
            _Str_3196 = false;
        }

        override protected function set activeView(k:IWindowContainer):void
        {
            if (!k)
            {
                return;
            }
            _Str_3007 = k;
        }

        public function isVisible():Boolean
        {
            return (_Str_3007) && (_Str_3007.visible);
        }

        public function _Str_2771():void
        {
            _Str_2304("decorate");
        }

        private function _Str_5162(k:WindowEvent, _arg_2:IWindow):void
        {
            if (disposed)
            {
                return;
            }
            if (((!(window)) || (window.disposed)))
            {
                return;
            }
            if (k.type == WindowMouseEvent.CLICK)
            {
                if (_arg_2.name == "button")
                {
                    switch (_arg_2.parent.name)
                    {
                        case "decorate":
                            this.widget._Str_5249 = false;
                            break;
                    }
                }
            }
            else
            {
                if (k.type == WindowMouseEvent.OVER)
                {
                    super.buttonEventProc(k, _arg_2);
                    _Str_3196 = true;
                }
                else
                {
                    if (k.type == WindowMouseEvent.OUT)
                    {
                        super.buttonEventProc(k, _arg_2);
                        _Str_3196 = false;
                    }
                    else
                    {
                        super.buttonEventProc(k, _arg_2);
                    }
                }
            }
        }

        override public function get maximumBlend():Number
        {
            return 0.8;
        }

        private function get widget():AvatarInfoWidget
        {
            return _Str_2268 as AvatarInfoWidget;
        }
    }
}
