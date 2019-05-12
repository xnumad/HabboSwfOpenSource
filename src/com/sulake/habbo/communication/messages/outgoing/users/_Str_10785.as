package com.sulake.habbo.communication.messages.outgoing.users
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class _Str_10785 implements IMessageComposer, IDisposable 
    {
        private var _Str_2156:Array;

        public function _Str_10785(k:String)
        {
            this._Str_2156 = new Array();
            super();
            this._Str_2156.push(k);
        }

        public function getMessageArray():Array
        {
            return this._Str_2156;
        }

        public function dispose():void
        {
            this._Str_2156 = null;
        }

        public function get disposed():Boolean
        {
            return false;
        }
    }
}
