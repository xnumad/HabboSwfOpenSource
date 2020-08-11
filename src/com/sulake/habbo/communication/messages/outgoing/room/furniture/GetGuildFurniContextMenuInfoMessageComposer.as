package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class GetGuildFurniContextMenuInfoMessageComposer implements IMessageComposer
    {
        private var _objectId:int;
        private var _guildId:int;

        public function GetGuildFurniContextMenuInfoMessageComposer(k:int, _arg_2:int)
        {
            this._objectId = k;
            this._guildId = _arg_2;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._objectId, this._guildId];
        }
    }
}
