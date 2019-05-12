package com.sulake.habbo.communication.messages.outgoing.help
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_18219 implements IMessageComposer 
    {
        private var _Str_12166:String;

        public function _Str_18219(k:String)
        {
            this._Str_12166 = k;
        }

        public function getMessageArray():Array
        {
            return [this._Str_12166];
        }

        public function dispose():void
        {
        }
    }
}
