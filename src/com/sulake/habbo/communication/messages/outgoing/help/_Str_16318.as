package com.sulake.habbo.communication.messages.outgoing.help
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_16318 implements IMessageComposer 
    {
        private var _Str_2629:int;

        public function _Str_16318(k:int)
        {
            this._Str_2629 = k;
        }

        public function getMessageArray():Array
        {
            return [this._Str_2629];
        }

        public function dispose():void
        {
        }
    }
}
