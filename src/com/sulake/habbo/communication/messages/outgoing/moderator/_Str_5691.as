package com.sulake.habbo.communication.messages.outgoing.moderator
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class _Str_5691 implements IMessageComposer, IDisposable 
    {
        public static const _Str_18408:int = 0;
        public static const _Str_17489:int = 1;
        public static const _Str_18637:int = 3;
        public static const _Str_16816:int = 4;

        private var _Str_2156:Array;

        public function _Str_5691(k:int, _arg_2:String, _arg_3:String)
        {
            this._Str_2156 = new Array();
            super();
            this._Str_2156.push(k);
            this._Str_2156.push(_arg_2);
            this._Str_2156.push(_arg_3);
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
