package com.sulake.habbo.communication.messages.outgoing.help
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_8147 implements IMessageComposer 
    {
        private var _Str_2156:Array;

        public function _Str_8147(k:String)
        {
            this._Str_2156 = [];
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
    }
}
