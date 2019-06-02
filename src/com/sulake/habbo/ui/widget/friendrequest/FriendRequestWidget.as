package com.sulake.habbo.ui.widget.friendrequest
{
    import com.sulake.habbo.ui.widget.ConversionTrackingWidget;
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.core.runtime.Component;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.ui.widget.events._Str_3549;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.ui.widget.events._Str_3174;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetGetObjectLocationMessage;
    import com.sulake.habbo.room.object.RoomObjectTypeEnum;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetFriendRequestMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetOpenProfileMessage;

    public class FriendRequestWidget extends ConversionTrackingWidget implements IUpdateReceiver 
    {
        private var _component:Component;
        private var _requests:Map;

        public function FriendRequestWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary, _arg_4:IHabboLocalizationManager, _arg_5:Component)
        {
            super(k, _arg_2, _arg_3, _arg_4);
            this._component = _arg_5;
            this._requests = new Map();
        }

        override public function dispose():void
        {
            var k:FriendRequestDialog;
            if (disposed)
            {
                return;
            }
            if (this._component)
            {
                this._component.removeUpdateReceiver(this);
                this._component = null;
            }
            if (this._requests)
            {
                for each (k in this._requests)
                {
                    k.dispose();
                    k = null;
                }
                this._requests.dispose();
                this._requests = null;
            }
            super.dispose();
        }

        override public function registerUpdateEvents(k:IEventDispatcher):void
        {
            if (!k)
            {
                return;
            }
            k.addEventListener(_Str_3549.RWFRUE_SHOW_FRIEND_REQUEST, this.eventHandler);
            k.addEventListener(_Str_3549.RWFRUE_HIDE_FRIEND_REQUEST, this.eventHandler);
            super.registerUpdateEvents(k);
        }

        override public function unregisterUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.removeEventListener(_Str_3549.RWFRUE_SHOW_FRIEND_REQUEST, this.eventHandler);
            k.removeEventListener(_Str_3549.RWFRUE_HIDE_FRIEND_REQUEST, this.eventHandler);
        }

        private function eventHandler(k:_Str_3549):void
        {
            if (!k)
            {
                return;
            }
            switch (k.type)
            {
                case _Str_3549.RWFRUE_SHOW_FRIEND_REQUEST:
                    this._Str_8472(k.requestId, new FriendRequestDialog(this, k.requestId, k.userId, k.userName));
                    break;
                case _Str_3549.RWFRUE_HIDE_FRIEND_REQUEST:
                    this._Str_7667(k.requestId);
                    break;
            }
            this._Str_4556();
        }

        public function _Str_4556():void
        {
            if (!this._component)
            {
                return;
            }
            if (((this._requests) && (this._requests.length > 0)))
            {
                this._component.registerUpdateReceiver(this, 10);
            }
            else
            {
                this._component.removeUpdateReceiver(this);
            }
        }

        public function update(k:uint):void
        {
            var _local_2:FriendRequestDialog;
            var _local_3:_Str_3174;
            if (!this._requests)
            {
                return;
            }
            for each (_local_2 in this._requests)
            {
                if (!_local_2)
                {
                }
                else
                {
                    _local_3 = (messageListener.processWidgetMessage(new RoomWidgetGetObjectLocationMessage(RoomWidgetGetObjectLocationMessage.RWGOI_MESSAGE_GET_OBJECT_LOCATION, _local_2.userId, RoomObjectTypeEnum.HABBO)) as _Str_3174);
                    if (!_local_3)
                    {
                    }
                    else
                    {
                        _local_2._Str_23989 = _local_3.rectangle;
                    }
                }
            }
        }

        public function _Str_11273(k:int):void
        {
            if (!messageListener)
            {
                return;
            }
            messageListener.processWidgetMessage(new RoomWidgetFriendRequestMessage(RoomWidgetFriendRequestMessage.RWFRM_ACCEPT, k));
            this._Str_7667(k);
        }

        public function _Str_12175(k:int):void
        {
            if (!messageListener)
            {
                return;
            }
            messageListener.processWidgetMessage(new RoomWidgetFriendRequestMessage(RoomWidgetFriendRequestMessage.RWFRM_DECLINE, k));
            this._Str_7667(k);
        }

        public function _Str_22064(k:int):void
        {
            this._Str_7667(k);
        }

        private function _Str_8472(k:int, _arg_2:FriendRequestDialog):void
        {
            if (((!(this._requests)) || (!(_arg_2))))
            {
                return;
            }
            this._requests.add(k, _arg_2);
        }

        private function _Str_7667(k:int):void
        {
            if (!this._requests)
            {
                return;
            }
            var _local_2:FriendRequestDialog = (this._requests.getValue(k) as FriendRequestDialog);
            if (!_local_2)
            {
                return;
            }
            this._requests.remove(k);
            _local_2.dispose();
            this._Str_4556();
        }

        public function showProfile(k:int, _arg_2:String):void
        {
            messageListener.processWidgetMessage(new RoomWidgetOpenProfileMessage(RoomWidgetOpenProfileMessage.RWOPEM_OPEN_USER_PROFILE, k, _arg_2));
        }
    }
}
