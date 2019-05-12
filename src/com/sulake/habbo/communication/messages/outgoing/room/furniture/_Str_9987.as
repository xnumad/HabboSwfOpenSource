package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_9987 implements IMessageComposer 
    {
        private var _Str_2156:Array;

        public function _Str_9987(k:int, _arg_2:String)
        {
            this._Str_2156 = [k, _arg_2];
        }

        public function getMessageArray():Array
        {
            return this._Str_2156;
        }

        public function dispose():void
        {
            this._Str_2156 = null;
        }
    }
}
