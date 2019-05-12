package com.sulake.habbo.communication.messages.outgoing.handshake
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_10368 implements IMessageComposer 
    {
        private var _Str_8149:String;
        private var _Str_21916:String;
        private var _Str_9609:String;

        public function _Str_10368(k:String, _arg_2:String, _arg_3:String)
        {
            this._Str_8149 = k;
            this._Str_21916 = _arg_2;
            this._Str_9609 = _arg_3;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._Str_8149, this._Str_21916, this._Str_9609];
        }
    }
}
