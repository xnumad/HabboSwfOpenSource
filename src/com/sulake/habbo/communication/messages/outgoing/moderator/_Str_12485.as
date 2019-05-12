package com.sulake.habbo.communication.messages.outgoing.moderator
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class _Str_12485 implements IMessageComposer, IDisposable 
    {
        public static const _Str_2979:int = -1;

        private var _Str_2156:Array;

        public function _Str_12485(k:int, _arg_2:String, _arg_3:int, _arg_4:int, _arg_5:int)
        {
            this._Str_2156 = new Array();
            super();
            this._Str_2156.push(k);
            this._Str_2156.push(_arg_2);
            this._Str_2156.push(_arg_3);
            this._Str_2156.push(_arg_4);
            if (_arg_5 != _Str_2979)
            {
                this._Str_2156.push(_arg_5);
            }
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
