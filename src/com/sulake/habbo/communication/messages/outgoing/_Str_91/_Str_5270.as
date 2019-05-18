package com.sulake.habbo.communication.messages.outgoing._Str_91
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_5270 implements IMessageComposer 
    {
        private var _Str_6913:int = 0;

        public function _Str_5270(k:int)
        {
            this._Str_6913 = k;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            var k:Array = new Array();
            k.push(this._Str_6913);
            return k;
        }
    }
}
