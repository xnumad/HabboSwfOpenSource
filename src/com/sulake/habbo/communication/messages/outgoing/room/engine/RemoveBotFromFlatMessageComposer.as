package com.sulake.habbo.communication.messages.outgoing.room.engine
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class RemoveBotFromFlatMessageComposer implements IMessageComposer
    {
        private var _botId:int;

        public function RemoveBotFromFlatMessageComposer(k:int)
        {
            this._botId = k;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._botId];
        }
    }
}
