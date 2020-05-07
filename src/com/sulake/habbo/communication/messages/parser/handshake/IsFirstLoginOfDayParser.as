package com.sulake.habbo.communication.messages.parser.handshake
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class IsFirstLoginOfDayParser implements IMessageParser 
    {
        private var isFirstLoginOfDay:Boolean;


        public function flush():Boolean
        {
            return false;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this.isFirstLoginOfDay = k.readBoolean();
            return true;
        }

        public function get _Str_18128():Boolean
        {
            return this.isFirstLoginOfDay;
        }
    }
}
