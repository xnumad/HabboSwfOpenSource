package com.sulake.habbo.communication.messages.outgoing.room.session
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class ChangeQueueMessageComposer implements IMessageComposer
    {
        private var _targetQueue:int;

        public function ChangeQueueMessageComposer(k:int)
        {
            this._targetQueue = k;
        }

        public function getMessageArray():Array
        {
            return [this._targetQueue];
        }

        public function dispose():void
        {
        }

        public function get disposed():Boolean
        {
            return true;
        }
    }
}
