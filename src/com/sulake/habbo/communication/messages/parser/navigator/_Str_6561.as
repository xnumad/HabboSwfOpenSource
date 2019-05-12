package com.sulake.habbo.communication.messages.parser.navigator
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6561 implements IMessageParser 
    {
        private var _flatId:int;
        private var _Str_20029:Boolean;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._flatId = k.readInteger();
            this._Str_20029 = k.readBoolean();
            return true;
        }

        public function get flatId():int
        {
            return this._flatId;
        }

        public function get _Str_13819():Boolean
        {
            return this._Str_20029;
        }
    }
}
