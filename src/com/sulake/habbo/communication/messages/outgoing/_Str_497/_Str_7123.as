package com.sulake.habbo.communication.messages.outgoing._Str_497
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_7123 implements IMessageComposer 
    {
        private var _Str_594:Array;

        public function _Str_7123(k:int)
        {
            this._Str_594 = [];
            super();
            this._Str_594.push(k);
        }

        public function getMessageArray():Array
        {
            return this._Str_594;
        }

        public function dispose():void
        {
        }
    }
}
