package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GuideSessionPartnerIsTypingMessageParser implements IMessageParser 
    {
        private var _isTyping:Boolean;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._isTyping = k.readBoolean();
            return true;
        }

        public function get _Str_7319():Boolean
        {
            return this._isTyping;
        }
    }
}
