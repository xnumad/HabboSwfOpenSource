package com.sulake.habbo.communication.messages.parser.landingview
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.landingview._Str_4053;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8888 implements IMessageParser 
    {
        private var _Str_4386:Array;


        public function get _Str_23579():Array
        {
            return this._Str_4386;
        }

        public function flush():Boolean
        {
            this._Str_4386 = [];
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._Str_4386.push(new _Str_4053(k));
                _local_3++;
            }
            return true;
        }
    }
}
