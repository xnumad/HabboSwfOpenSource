package com.sulake.habbo.communication.messages.outgoing._Str_81
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_12206 implements IMessageComposer 
    {
        private var _Str_12122:int;

        public function _Str_12206(k:int)
        {
            this._Str_12122 = k;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._Str_12122];
        }
    }
}
