package com.sulake.habbo.communication.messages.outgoing.catalog
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_17078 implements IMessageComposer 
    {
        private var _days:int;

        public function _Str_17078(k:int)
        {
            this._days = k;
        }

        public function getMessageArray():Array
        {
            return [this._days];
        }

        public function dispose():void
        {
        }
    }
}
