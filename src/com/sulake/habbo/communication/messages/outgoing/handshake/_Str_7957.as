package com.sulake.habbo.communication.messages.outgoing.handshake
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import flash.utils.getTimer;

    public class _Str_7957 implements IMessageComposer 
    {
        private var _Str_1518:Array;

        public function _Str_7957(k:String)
        {
            this._Str_1518 = new Array();
            this._Str_1518.push(k);
            this._Str_1518.push(getTimer());
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return this._Str_1518;
        }
    }
}
