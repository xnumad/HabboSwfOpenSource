package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class _Str_11937 implements IMessageComposer, IDisposable 
    {
        private var _Str_2156:Array;

        public function _Str_11937(k:int, _arg_2:int, _arg_3:int)
        {
            this._Str_2156 = new Array();
            super();
            this._Str_2156 = [k, _arg_2, _arg_3];
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
