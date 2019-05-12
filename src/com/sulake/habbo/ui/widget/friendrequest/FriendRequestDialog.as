package com.sulake.habbo.ui.widget.friendrequest
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IIconWindow;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.geom.Point;
    import flash.geom.Rectangle;

    public class FriendRequestDialog 
    {
        private var _window:IWindowContainer;
        private var _widget:FriendRequestWidget;
        private var _requestId:int;
        private var _userId:int;
        private var _userName:String;
        private var _lockPosition:Boolean = false;
        private var _drag:Boolean = false;
        private var _deactivated:Boolean = false;

        public function FriendRequestDialog(k:FriendRequestWidget, _arg_2:int, _arg_3:int, _arg_4:String)
        {
            this._widget = k;
            this._requestId = _arg_2;
            this._userId = _arg_3;
            this._userName = _arg_4;
        }

        public function dispose():void
        {
            this._widget = null;
            if (this._window)
            {
                this._window.dispose();
            }
            this._window = null;
        }

        private function _Str_2786(k:IWindow, _arg_2:Function):void
        {
            if (k != null)
            {
                k.setParamFlag(WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR, true);
                k.addEventListener(WindowMouseEvent.CLICK, _arg_2);
            }
        }

        private function createWindow():void
        {
            if ((((!(this._widget)) || (!(this._widget.assets))) || (!(this._widget.windowManager))))
            {
                return;
            }
            var k:XmlAsset = (this._widget.assets.getAssetByName("instant_friend_request") as XmlAsset);
            if (!k)
            {
                return;
            }
            this._window = (this._widget.windowManager.buildFromXML((k.content as XML), 0) as IWindowContainer);
            if (!this._window)
            {
                return;
            }
            this._window.addEventListener(WindowEvent.WINDOW_EVENT_DEACTIVATED, this._Str_23221);
            var _local_2:IRegionWindow = (this._window.findChildByName("profile_region") as IRegionWindow);
            if (_local_2)
            {
                _local_2.procedure = this._Str_18339;
                _local_2._Str_2613 = this._widget.localizations.getLocalization("infostand.profile.link.tooltip", "");
                _local_2._Str_3099 = 100;
            }
            var _local_3:ITextWindow = (this._window.findChildByName("text") as ITextWindow);
            if (_local_3)
            {
                _local_3.text = this._widget.localizations.registerParameter("widget.friendrequest.from", "username", this._userName);
            }
            var _local_4:IWindow = this._window.findChildByName("accept_button");
            this._Str_2786(_local_4, this._Str_16362);
            var _local_5:IWindow = this._window.findChildByName("decline_button");
            this._Str_2786(_local_5, this._Str_23136);
            var _local_6:IWindow = this._window.findChildByName("close_button");
            this._Str_2786(_local_6, this.onCloseHandler);
            var _local_7:IIconWindow = (this._window.findChildByName("profile_icon") as IIconWindow);
            _local_7.procedure = this._Str_22905;
            this._window.procedure = this._Str_3545;
            this._window.visible = false;
        }

        private function _Str_3545(k:WindowEvent, _arg_2:IWindow):void
        {
            if (!k)
            {
                return;
            }
            switch (k.type)
            {
                case WindowMouseEvent.OVER:
                    this._lockPosition = true;
                    return;
                case WindowMouseEvent.OUT:
                    this._lockPosition = false;
                    return;
                case WindowMouseEvent.DOWN:
                    this._drag = true;
                    return;
                case WindowMouseEvent.UP:
                case WindowMouseEvent.UP_OUTSIDE:
                    this._drag = false;
                    return;
            }
        }

        public function _Str_16818(k:IBitmapWrapperWindow, _arg_2:String):void
        {
            if ((((!(k)) || (!(this._widget))) || (!(this._widget.assets))))
            {
                return;
            }
            var _local_3:BitmapDataAsset = (this._widget.assets.getAssetByName(_arg_2) as BitmapDataAsset);
            if (!_local_3)
            {
                return;
            }
            var _local_4:BitmapData = (_local_3.content as BitmapData);
            if (!_local_4)
            {
                return;
            }
            if (k.bitmap)
            {
                k.bitmap.dispose();
            }
            k.bitmap = new BitmapData(k.width, k.height, true, 0);
            k.bitmap.draw(_local_4);
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function show():void
        {
            if (this._window != null)
            {
                this._window.visible = true;
                this._window.activate();
            }
        }

        public function set _Str_23989(k:Rectangle):void
        {
            var _local_5:Point;
            if (!k)
            {
                this._widget._Str_22064(this._requestId);
                return;
            }
            if (((this._lockPosition) || (this._drag)))
            {
                return;
            }
            var _local_2:Boolean = true;
            if (!this._window)
            {
                this.createWindow();
                _local_2 = false;
            }
            if (!this._window)
            {
                return;
            }
            var _local_3:Point = new Point(((k.left + (k.width / 2)) - (this._window.width / 2)), ((k.top - this._window.height) + 10));
            var _local_4:Number = Point.distance(this._window.position, _local_3);
            if (((_local_2) && (_local_4 > 5)))
            {
                _local_5 = Point.interpolate(this._window.position, _local_3, 0.5);
                this._window.x = _local_5.x;
                this._window.y = _local_5.y;
            }
            else
            {
                this._window.x = _local_3.x;
                this._window.y = _local_3.y;
            }
            if (!this._window.visible)
            {
                this.show();
            }
            if (this._deactivated)
            {
                this.show();
                this._deactivated = false;
            }
        }

        private function _Str_23221(k:WindowEvent):void
        {
            this._deactivated = true;
        }

        private function onCloseHandler(k:WindowMouseEvent):void
        {
            if (this._widget != null)
            {
                this._widget._Str_22064(this._requestId);
            }
        }

        private function _Str_16362(k:WindowMouseEvent):void
        {
            if (this._widget != null)
            {
                this._widget._Str_11273(this._requestId);
            }
        }

        private function _Str_23136(k:WindowMouseEvent):void
        {
            if (this._widget != null)
            {
                this._widget._Str_12175(this._requestId);
            }
        }

        private function _Str_18339(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:ITextWindow;
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._widget.showProfile(this._userId, "instantFriendRequest_name");
            }
            if (k.type == WindowMouseEvent.OVER)
            {
                _local_3 = (this._window.findChildByName("text") as ITextWindow);
                _local_3.underline = true;
            }
            if (k.type == WindowMouseEvent.OUT)
            {
                _local_3 = (this._window.findChildByName("text") as ITextWindow);
                _local_3.underline = false;
            }
        }

        private function _Str_22905(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:IIconWindow;
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._widget.showProfile(this._userId, "instantFriendRequest_icon");
            }
            if (k.type == WindowMouseEvent.OVER)
            {
                _local_3 = (this._window.findChildByName("profile_icon") as IIconWindow);
                _local_3.style = 22;
                _local_3.invalidate();
            }
            if (k.type == WindowMouseEvent.OUT)
            {
                _local_3 = (this._window.findChildByName("profile_icon") as IIconWindow);
                _local_3.style = 21;
                _local_3.invalidate();
            }
        }
    }
}
