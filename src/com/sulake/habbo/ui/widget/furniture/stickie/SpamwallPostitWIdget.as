package com.sulake.habbo.ui.widget.furniture.stickie
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.ui.widget.events._Str_5436;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.ui.widget.events._Str_4863;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetSpamWallPostItFinishEditingMessage;

    public class SpamwallPostitWIdget extends StickieFurniWidget 
    {
        private var _location:String = "";

        public function SpamwallPostitWIdget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary=null)
        {
            _Str_18958 = "spamwall_postit_container";
            super(k, _arg_2, _arg_3);
        }

        override public function dispose():void
        {
            _Str_2319 = -1;
            this._location = "";
            super.dispose();
        }

        override public function registerUpdateEvents(k:IEventDispatcher):void
        {
            k.addEventListener(_Str_5436.RWSWPUE_OPEN_EDITOR, this._Str_22050);
            super.registerUpdateEvents(k);
        }

        override public function unregisterUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.removeEventListener(_Str_5436.RWSWPUE_OPEN_EDITOR, this._Str_22050);
        }

        override protected function onObjectUpdate(k:_Str_4863):void
        {
        }

        private function _Str_22050(k:_Str_5436):void
        {
            _Str_2718(false);
            _Str_2319 = k._Str_1577;
            this._location = k.location;
            _Str_3796 = k.objectType;
            _text = "";
            _Str_3062 = "FFFF33";
            _Str_2278 = true;
            _Str_3030();
        }

        override protected function sendUpdate():void
        {
            var k:RoomWidgetSpamWallPostItFinishEditingMessage;
            if (_Str_2319 != -1)
            {
                _Str_9532();
                Logger.log("Spamwall Post-It Widget Send Update");
                if (messageListener != null)
                {
                    k = new RoomWidgetSpamWallPostItFinishEditingMessage(RoomWidgetSpamWallPostItFinishEditingMessage.RWSWPFEE_SEND_POSTIT_DATA, _Str_2319, this._location, _text, _Str_3062);
                    messageListener.processWidgetMessage(k);
                }
                _Str_2718(false);
            }
        }

        override protected function sendSetColor(k:uint):void
        {
            _Str_9532();
            var _local_2:String = k.toString(16).toUpperCase();
            if (_local_2.length > 6)
            {
                _local_2 = _local_2.slice((_local_2.length - 6), _local_2.length);
            }
            if (_local_2 == _Str_3062)
            {
                return;
            }
            _Str_3062 = _local_2;
            _Str_3030();
        }

        override protected function sendDelete():void
        {
            _Str_2718(false);
        }
    }
}
