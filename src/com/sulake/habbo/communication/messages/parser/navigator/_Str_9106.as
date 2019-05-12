package com.sulake.habbo.communication.messages.parser.navigator
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_9106 implements IMessageParser 
    {
        private var _flatId:int;
        private var _Str_3145:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._flatId = k.readInteger();
            this._Str_3145 = k.readInteger();
            return true;
        }

        public function get flatId():int
        {
            return this._flatId;
        }

        public function get _Str_3278():int
        {
            return this._Str_3145;
        }
    }
}
