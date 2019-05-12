package com.sulake.habbo.communication.messages.outgoing.moderator
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class _Str_12412 implements IMessageComposer, IDisposable 
    {
        private var _Str_2156:Array;

        public function _Str_12412(k:int, _arg_2:Boolean, _arg_3:Boolean, _arg_4:Boolean)
        {
            this._Str_2156 = new Array();
            super();
            this._Str_2156.push(k);
            this._Str_2156.push(((_arg_2) ? 1 : 0));
            this._Str_2156.push(((_arg_3) ? 1 : 0));
            this._Str_2156.push(((_arg_4) ? 1 : 0));
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
