package com.sulake.habbo.communication.messages.outgoing.room.action
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_10476 implements IMessageComposer 
    {
        private var _Str_1518:Array;

        public function _Str_10476(k:String, _arg_2:Boolean)
        {
            this._Str_1518 = [k, _arg_2];
        }

        public function dispose():void
        {
            this._Str_1518 = null;
        }

        public function getMessageArray():Array
        {
            return this._Str_1518;
        }
    }
}
