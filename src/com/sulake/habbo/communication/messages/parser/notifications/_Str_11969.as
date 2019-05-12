package com.sulake.habbo.communication.messages.parser.notifications
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_11969 implements IMessageParser 
    {
        private var _enabled:Boolean;


        public function flush():Boolean
        {
            this._enabled = false;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._enabled = k.readBoolean();
            return true;
        }

        public function get enabled():Boolean
        {
            return this._enabled;
        }
    }
}
