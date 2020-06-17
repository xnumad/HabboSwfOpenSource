package com.sulake.habbo.communication.messages.outgoing.catalog
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_11905 implements IMessageComposer 
    {
        private var _offerId:int;

        public function _Str_11905(k:int)
        {
            this._offerId = k;
        }

        public function getMessageArray():Array
        {
            return [this._offerId];
        }

        public function dispose():void
        {
        }
    }
}
