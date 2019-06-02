package com.sulake.habbo.communication.messages.parser.advertisement
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7915 implements IMessageParser 
    {
        private var _Str_18536:Boolean;


        public function get _Str_24162():Boolean
        {
            return this._Str_18536;
        }

        public function flush():Boolean
        {
            this._Str_18536 = false;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_18536 = k.readBoolean();
            return true;
        }
    }
}
