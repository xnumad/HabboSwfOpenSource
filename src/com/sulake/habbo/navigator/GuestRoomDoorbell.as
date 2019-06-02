package com.sulake.habbo.navigator
{
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2370;
    import com.sulake.core.window.components.ITextWindow;
    import flash.geom.Point;
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.communication.messages.outgoing._Str_84._Str_3719;

    public class GuestRoomDoorbell 
    {
        private var _navigator:IHabboTransitionalNavigator;
        private var _window:IFrameWindow;
        private var _roomData:_Str_2370;
        private var _isWaiting:Boolean;

        public function GuestRoomDoorbell(k:IHabboTransitionalNavigator)
        {
            this._navigator = k;
        }

        public function show(k:_Str_2370, _arg_2:Point=null, _arg_3:Boolean=false):void
        {
            if (k == null)
            {
                return;
            }
            this._roomData = k;
            this._isWaiting = _arg_3;
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
            var _local_4:ITextWindow = (this._window.findChildByName("room_name") as ITextWindow);
            if (_local_4 != null)
            {
                _local_4.text = k.roomName;
            }
            if (this._isWaiting)
            {
                this._Str_2497("info", "${navigator.doorbell.waiting}");
                this._Str_2497("cancel", "${navigator.doorbell.button.cancel.entering}");
                this._Str_2304("ring", false);
            }
            else
            {
                this._Str_2497("info", "${navigator.doorbell.info}");
                this._Str_2497("cancel", "${generic.cancel}");
                this._Str_2304("ring", true);
            }
        }

        public function _Str_19346():void
        {
            this.show(this._roomData, null, true);
        }

        public function _Str_20293():void
        {
            if (this._window == null)
            {
                return;
            }
            this._window.visible = true;
            this._window.activate();
            this._Str_2497("info", "${navigator.doorbell.no.answer}");
            this._Str_2304("ring", false);
        }

        private function _Str_2304(k:String, _arg_2:Boolean):void
        {
            var _local_3:IButtonWindow = (this._window.findChildByName(k) as IButtonWindow);
            if (_local_3 == null)
            {
                return;
            }
            _local_3.visible = _arg_2;
        }

        private function createWindow():void
        {
            if (this._window != null)
            {
                return;
            }
            var k:XmlAsset = (this._navigator.assets.getAssetByName("doorbell_xml") as XmlAsset);
            this._window = (this._navigator.windowManager.buildFromXML((k.content as XML), 2) as IFrameWindow);
            if (this._window == null)
            {
                return;
            }
            var _local_2:IButtonWindow = (this._window.findChildByName("ring") as IButtonWindow);
            if (_local_2 != null)
            {
                _local_2.addEventListener(WindowMouseEvent.CLICK, this._Str_23149);
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

        private function _Str_2497(k:String, _arg_2:String):void
        {
            if (this._window == null)
            {
                return;
            }
            var _local_3:IWindow = this._window.findChildByName(k);
            if (_local_3 == null)
            {
                return;
            }
            _local_3.caption = _arg_2;
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

        private function _Str_23149(k:WindowMouseEvent):void
        {
            this._navigator.goToRoom(this._roomData.flatId, true);
            this.hide();
        }

        private function close(k:WindowMouseEvent):void
        {
            if (this._window == null)
            {
                return;
            }
            if (((this._isWaiting) && (!(this._navigator == null))))
            {
                this._navigator.send(new _Str_3719());
            }
            this._window.dispose();
            this._window = null;
        }

        public function hide():void
        {
            if (this._window == null)
            {
                return;
            }
            this._window.visible = false;
        }
    }
}


