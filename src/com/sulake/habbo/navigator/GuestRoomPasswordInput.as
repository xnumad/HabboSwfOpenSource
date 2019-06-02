package com.sulake.habbo.navigator
{
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2370;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IPasswordFieldWindow;
    import flash.geom.Point;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.IWindow;

    public class GuestRoomPasswordInput 
    {
        private var _navigator:IHabboTransitionalNavigator;
        private var _window:IFrameWindow;
        private var _roomData:_Str_2370;

        public function GuestRoomPasswordInput(k:IHabboTransitionalNavigator)
        {
            this._navigator = k;
        }

        public function show(k:_Str_2370, _arg_2:Point=null):void
        {
            this._roomData = k;
            if (this._roomData == null)
            {
                return;
            }
            this.createWindow();
            if (this._window == null)
            {
                return;
            }
            if (_arg_2 != null)
            {
                _arg_2.offset((-(this._window.width) / 2), (-(this._window.height) / 2));
                this._window.setGlobalPosition(_arg_2);
            }
            this._window.visible = true;
            this._window.activate();
            var _local_3:ITextWindow = (this._window.findChildByName("room_name") as ITextWindow);
            if (((!(_local_3 == null)) && (!(k == null))))
            {
                _local_3.text = k.roomName;
            }
            var _local_4:IPasswordFieldWindow = (this._window.findChildByName("password_input") as IPasswordFieldWindow);
            if (_local_4 != null)
            {
                _local_4.text = "";
            }
            this._Str_5311("${navigator.password.info}");
        }

        private function createWindow():void
        {
            if (this._window != null)
            {
                return;
            }
            var k:XmlAsset = (this._navigator.assets.getAssetByName("password_input_xml") as XmlAsset);
            this._window = (this._navigator.windowManager.buildFromXML((k.content as XML), 2) as IFrameWindow);
            if (this._window == null)
            {
                return;
            }
            var _local_2:IButtonWindow = (this._window.findChildByName("try") as IButtonWindow);
            if (_local_2 != null)
            {
                _local_2.addEventListener(WindowMouseEvent.CLICK, this._Str_24102);
            }
            var _local_3:IWindow = this._window.findChildByName("cancel_region");
            if (_local_3 != null)
            {
                _local_3.addEventListener(WindowMouseEvent.CLICK, this.close);
            }
            var _local_4:IWindow = this._window.findChildByTag("close");
            if (_local_4 != null)
            {
                _local_4.addEventListener(WindowMouseEvent.CLICK, this.close);
            }
        }

        public function _Str_15400():void
        {
            this.show(this._roomData);
            this._Str_5311("${navigator.password.retryinfo}");
        }

        private function _Str_5311(k:String):void
        {
            if (this._window == null)
            {
                return;
            }
            var _local_2:ITextWindow = (this._window.findChildByName("info") as ITextWindow);
            if (_local_2 == null)
            {
                return;
            }
            _local_2.caption = k;
        }

        public function dispose():void
        {
            if (this._window != null)
            {
                this._window.dispose();
            }
            this._window = null;
            this._navigator = null;
            this._roomData = null;
        }

        private function _Str_24102(k:WindowMouseEvent):void
        {
            var _local_2:IPasswordFieldWindow = (this._window.findChildByName("password_input") as IPasswordFieldWindow);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:String = _local_2.text;
            this._navigator.goToRoom(this._roomData.flatId, true, _local_3);
            this.hide();
        }

        private function close(k:WindowMouseEvent):void
        {
            if (this._window == null)
            {
                return;
            }
            this._window.dispose();
            this._window = null;
        }

        private function hide(k:WindowMouseEvent=null):void
        {
            if (this._window == null)
            {
                return;
            }
            this._window.visible = false;
        }
    }
}


