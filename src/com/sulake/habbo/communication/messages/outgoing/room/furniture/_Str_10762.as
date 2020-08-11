package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_10762 implements IMessageComposer 
    {
        private var _furniId:int;

        public function _Str_10762(k:int)
        {
            this._furniId = k;
        }

        public function getMessageArray():Array
        {
            return [this._furniId];
        }

        public function dispose():void
        {
        }
    }
}
