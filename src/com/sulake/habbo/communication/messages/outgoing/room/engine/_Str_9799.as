package com.sulake.habbo.communication.messages.outgoing.room.engine
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_9799 implements IMessageComposer 
    {
        private var _objectId:int;

        public function _Str_9799(k:int)
        {
            this._objectId = k;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._objectId];
        }
    }
}
