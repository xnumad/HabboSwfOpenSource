package com.sulake.habbo.communication.messages.outgoing.room.action
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_10476 implements IMessageComposer 
    {
        private var _message:Array;

        public function _Str_10476(k:String, _arg_2:Boolean)
        {
            this._message = [k, _arg_2];
        }

        public function dispose():void
        {
            this._message = null;
        }

        public function getMessageArray():Array
        {
            return this._message;
        }
    }
}
