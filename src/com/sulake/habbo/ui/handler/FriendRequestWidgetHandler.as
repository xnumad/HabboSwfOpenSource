package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetFriendRequestMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.session.events.RoomSessionFriendRequestEvent;
    import com.sulake.habbo.friendlist.events._Str_2948;
    import com.sulake.habbo.ui.widget.events._Str_3549;
    import flash.events.Event;

    public class FriendRequestWidgetHandler implements IRoomWidgetHandler 
    {
        private var _disposed:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer = null;


        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get type():String
        {
            return RoomWidgetEnum.ROOM_POLL;
        }

        public function set container(k:IRoomWidgetHandlerContainer):void
        {
            this._container = k;
        }

        public function dispose():void
        {
            this._disposed = true;
            this._container = null;
        }

        public function _Str_2607():Array
        {
            var k:Array = [];
            k.push(RoomWidgetFriendRequestMessage.RWFRM_ACCEPT);
            k.push(RoomWidgetFriendRequestMessage.RWFRM_DECLINE);
            return k;
        }

        public function processWidgetMessage(k:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            var _local_2:RoomWidgetFriendRequestMessage;
            var _local_3:RoomWidgetFriendRequestMessage;
            if (((!(k)) || (!(this._container))))
            {
                return null;
            }
            switch (k.type)
            {
                case RoomWidgetFriendRequestMessage.RWFRM_ACCEPT:
                    _local_2 = (k as RoomWidgetFriendRequestMessage);
                    if (((!(_local_2)) || (!(this._container.friendList))))
                    {
                        return null;
                    }
                    this._container.friendList.acceptFriendRequest(_local_2.requestId);
                    break;
                case RoomWidgetFriendRequestMessage.RWFRM_DECLINE:
                    _local_3 = (k as RoomWidgetFriendRequestMessage);
                    if (((!(_local_3)) || (!(this._container.friendList))))
                    {
                        return null;
                    }
                    this._container.friendList.declineFriendRequest(_local_3.requestId);
                    break;
            }
            return null;
        }

        public function _Str_2609():Array
        {
            var k:Array = [];
            k.push(RoomSessionFriendRequestEvent.RSFRE_FRIEND_REQUEST);
            k.push(_Str_2948.FRE_ACCEPTED);
            k.push(_Str_2948.FRE_DECLINED);
            return k;
        }

        public function _Str_2485(k:Event):void
        {
            var _local_2:_Str_3549;
            var _local_3:String;
            var _local_4:RoomSessionFriendRequestEvent;
            var _local_5:_Str_2948;
            if (((this._container == null) || (this._container.events == null)))
            {
                return;
            }
            switch (k.type)
            {
                case RoomSessionFriendRequestEvent.RSFRE_FRIEND_REQUEST:
                    _local_4 = (k as RoomSessionFriendRequestEvent);
                    if (!_local_4)
                    {
                        return;
                    }
                    _local_3 = _Str_3549.RWFRUE_SHOW_FRIEND_REQUEST;
                    _local_2 = new _Str_3549(_local_3, _local_4.requestId, _local_4.userId, _local_4.userName);
                    break;
                case _Str_2948.FRE_ACCEPTED:
                case _Str_2948.FRE_DECLINED:
                    _local_5 = (k as _Str_2948);
                    if (!_local_5)
                    {
                        return;
                    }
                    _local_3 = _Str_3549.RWFRUE_HIDE_FRIEND_REQUEST;
                    _local_2 = new _Str_3549(_local_3, _local_5.requestId);
                    break;
            }
            if (_local_2)
            {
                this._container.events.dispatchEvent(_local_2);
            }
        }

        public function update():void
        {
        }
    }
}
