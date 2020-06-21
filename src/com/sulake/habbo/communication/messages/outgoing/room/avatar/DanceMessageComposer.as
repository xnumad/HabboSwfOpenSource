package com.sulake.habbo.communication.messages.outgoing.room.avatar
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class DanceMessageComposer implements IMessageComposer
    {
        private var _style:int;

        public function DanceMessageComposer(k:int)
        {
            this._style = k;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._style];
        }
    }
}
