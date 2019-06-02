package com.sulake.habbo.communication.messages.outgoing._Str_94
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_11266 implements IMessageComposer 
    {
        private var _type:int;

        public function _Str_11266(k:int)
        {
            this._type = k;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            var k:Array = new Array();
            k.push(this._type);
            return k;
        }
    }
}
