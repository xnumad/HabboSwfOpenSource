package com.sulake.habbo.communication.messages.parser.friendlist
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8705 implements IMessageParser 
    {
        private var _success:Boolean;


        public function get success():Boolean
        {
            return this._success;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._success = k.readBoolean();
            return true;
        }
    }
}
