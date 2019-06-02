package com.sulake.habbo.help.cfh.registry.chat
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.help.HabboHelp;
    import com.sulake.habbo.session.events.RoomSessionChatEvent;
    import com.sulake.habbo.session.RoomUserData;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2370;
    import com.sulake.habbo.room.object.RoomObjectTypeEnum;

    public class ChatEventHandler implements IDisposable 
    {
        private var _component:HabboHelp;

        public function ChatEventHandler(k:HabboHelp)
        {
            this._component = k;
            this._component.roomSessionManager.events.addEventListener(RoomSessionChatEvent.RSCE_CHAT_EVENT, this.onRoomChat);
        }

        public function dispose():void
        {
            if (!this.disposed)
            {
                if (this._component)
                {
                    this._component.roomSessionManager.events.removeEventListener(RoomSessionChatEvent.RSCE_CHAT_EVENT, this.onRoomChat);
                    this._component = null;
                }
            }
        }

        public function get disposed():Boolean
        {
            return this._component == null;
        }

        private function onRoomChat(k:RoomSessionChatEvent):void
        {
            var _local_2:RoomUserData = this._component.roomSessionManager.getSession(k.session.roomId).userDataManager.getUserDataByIndex(k.userId);
            var _local_3:_Str_2370 = this._component.navigator.enteredGuestRoomData;
            if ((((!(_local_2)) || (!(_local_2.type == RoomObjectTypeEnum.HABBO))) || (!(_local_3))))
            {
                return;
            }
            var _local_4:String = ((_local_3) ? _local_3.roomName : "Unknown Room");
            this._component._Str_3531._Str_2822(k.session.roomId, _local_4, _local_2._Str_2394, _local_2.name, k.text);
        }
    }
}
