package com.sulake.habbo.communication.messages.outgoing.inventory.trading
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class OpenTradingComposer implements IMessageComposer
    {
        private var _Str_20479:int;

        public function OpenTradingComposer(k:int)
        {
            this._Str_20479 = k;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._Str_20479];
        }
    }
}
