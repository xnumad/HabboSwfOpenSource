package com.sulake.habbo.communication.messages.outgoing.moderator
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class _Str_11910 implements IMessageComposer, IDisposable 
    {
        private var _Str_2156:Array;

        public function _Str_11910(k:int)
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
