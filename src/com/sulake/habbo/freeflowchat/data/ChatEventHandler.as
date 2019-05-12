package com.sulake.habbo.freeflowchat.data
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.freeflowchat.HabboFreeFlowChat;
    import com.sulake.habbo.session.events.RoomSessionChatEvent;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.utils.IVector3D;
    import flash.utils.getTimer;
    import com.sulake.habbo.game.events.GameChatEvent;

    public class ChatEventHandler implements IDisposable 
    {
        private var _component:HabboFreeFlowChat;
        private var _lastAddedChatMs:uint = 0;
        private var _chatFakeMsIncrementor:uint = 0;

        public function ChatEventHandler(k:HabboFreeFlowChat)
        {
            this._component = k;
            this._component.roomSessionManager.events.addEventListener(RoomSessionChatEvent.RSCE_CHAT_EVENT, this._Str_7971);
        }

        public function dispose():void
        {
            if (!this.disposed)
            {
                if (this._component)
                {
                    this._component.roomSessionManager.events.removeEventListener(RoomSessionChatEvent.RSCE_CHAT_EVENT, this._Str_7971);
                    this._component = null;
                }
            }
        }

        public function get disposed():Boolean
        {
            return this._component == null;
        }

        private function _Str_7971(k:RoomSessionChatEvent):void
        {
            var _local_2:IRoomObject = this._component.roomEngine.getRoomObject(k.session.roomId, k.userId, RoomObjectCategoryEnum.CONST_100);
            var _local_3:IVector3D;
            if (_local_2 != null)
            {
                _local_3 = _local_2.getLocation();
            }
            var _local_4:uint = getTimer();
            if (_local_4 == this._lastAddedChatMs)
            {
                this._chatFakeMsIncrementor++;
            }
            else
            {
                this._chatFakeMsIncrementor = 0;
            }
            this._component._Str_15063(new ChatItem(k, (_local_4 + this._chatFakeMsIncrementor), _local_3, k._Str_2415));
            this._lastAddedChatMs = _local_4;
        }

        private function _Str_20532(k:GameChatEvent):void
        {
            var _local_2:RoomSessionChatEvent = new RoomSessionChatEvent(RoomSessionChatEvent.RSCE_CHAT_EVENT, null, k.userId, k.message);
            this._component._Str_15063(new ChatItem(_local_2, getTimer(), null, 0, k._Str_19907, k.color, k.figure, k.name));
        }
    }
}
