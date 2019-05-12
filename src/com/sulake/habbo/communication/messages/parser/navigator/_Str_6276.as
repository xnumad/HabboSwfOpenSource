package com.sulake.habbo.communication.messages.parser.navigator
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_4253;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6276 implements IMessageParser 
    {
        private var _Str_15801:Array;


        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_15801 = new Array();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._Str_15801.push(new _Str_4253(k));
                _local_3++;
            }
            return true;
        }

        public function flush():Boolean
        {
            this._Str_15801 = null;
            return true;
        }

        public function get _Str_10701():Array
        {
            return this._Str_15801;
        }
    }
}
