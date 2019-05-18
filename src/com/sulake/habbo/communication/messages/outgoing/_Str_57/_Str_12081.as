package com.sulake.habbo.communication.messages.outgoing._Str_57
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class _Str_12081 implements IMessageComposer, IDisposable 
    {
        private var _content:Array;

        public function _Str_12081(k:String)
        {
            this._content = new Array();
            super();
            this._content.push(k);
        }

        public function getMessageArray():Array
        {
            return this._content;
        }

        public function dispose():void
        {
            this._content = null;
        }

        public function get disposed():Boolean
        {
            return false;
        }
    }
}
