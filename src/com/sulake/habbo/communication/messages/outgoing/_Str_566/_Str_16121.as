package com.sulake.habbo.communication.messages.outgoing._Str_566
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_16121 implements IMessageComposer 
    {
        private var _Str_594:Array;

        public function _Str_16121(k:int)
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
            this._Str_594 = [];
        }
    }
}
