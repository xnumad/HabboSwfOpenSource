package com.sulake.habbo.help.cfh.registry.instantmessage
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.help.HabboHelp;
    import com.sulake.habbo.communication.messages.incoming.friendlist.NewConsoleMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.friendlist.RoomInviteEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist.NewConsoleMessageMessageParser;
    import com.sulake.habbo.communication.messages.parser.friendlist.RoomInviteMessageParser;

    public class InstantMessageEventHandler implements IDisposable 
    {
        private var _component:HabboHelp;

        public function InstantMessageEventHandler(k:HabboHelp)
        {
            this._component = k;
            this._component.addMessageEvent(new NewConsoleMessageEvent(this._Str_24521));
            this._component.addMessageEvent(new RoomInviteEvent(this.onRoomInvite));
        }

        public function _Str_24521(k:NewConsoleMessageEvent):void
        {
            var _local_3:String;
            var _local_4:String;
            var _local_2:NewConsoleMessageMessageParser = k.getParser();
            if (((_local_2.senderId < 0) && (!(_local_2.extraData == null))))
            {
                _local_3 = _local_2.extraData.split("/")[2];
                _local_4 = _local_2.extraData.split("/")[0];
                this._component.instantMessageRegistry.addItem(_local_2.senderId, ((_local_3 + ":") + _local_4), _local_2._Str_3460);
            }
            else
            {
                this._component.instantMessageRegistry.addItem(_local_2.senderId, "", _local_2._Str_3460);
            }
        }

        public function onRoomInvite(k:RoomInviteEvent):void
        {
            var _local_2:RoomInviteMessageParser = k.getParser();
            this._component.instantMessageRegistry.addItem(_local_2.senderId, "", _local_2._Str_3460);
        }

        public function dispose():void
        {
            if (!this.disposed)
            {
                if (this._component)
                {
                    this._component = null;
                }
            }
        }

        public function get disposed():Boolean
        {
            return this._component == null;
        }
    }
}
