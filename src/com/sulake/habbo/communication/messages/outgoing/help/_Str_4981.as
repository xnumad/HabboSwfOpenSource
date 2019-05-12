package com.sulake.habbo.communication.messages.outgoing.help
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class _Str_4981 implements IMessageComposer, IDisposable 
    {
        private var _Str_2156:Array;

        public function _Str_4981()
        {
            this._Str_2156 = [];
            super();
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
            return this._Str_2156 == null;
        }
    }
}
