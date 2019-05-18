package com.sulake.habbo.communication.messages.outgoing._Str_463
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_12504 implements IMessageComposer 
    {
        private var _Str_11669:Array;

        public function _Str_12504(k:Array)
        {
            this._Str_11669 = new Array();
            this._Str_11669.push(k.length);
            this._Str_11669 = this._Str_11669.concat(k);
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return this._Str_11669;
        }
    }
}
