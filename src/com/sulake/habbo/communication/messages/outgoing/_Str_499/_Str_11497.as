package com.sulake.habbo.communication.messages.outgoing._Str_499
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_11497 implements IMessageComposer 
    {
        private var _Str_594:Array;

        public function _Str_11497()
        {
            this._Str_594 = [];
            super();
        }

        public function dispose():void
        {
            this._Str_594 = null;
        }

        public function getMessageArray():Array
        {
            return this._Str_594;
        }
    }
}
