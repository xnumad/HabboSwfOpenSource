package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.userdefinedroomevents.WiredRewardResultMessageParser;

    public class WiredRewardResultMessageEvent extends MessageEvent implements IMessageEvent
    {
        public static const _Str_18436:int = 6;
        public static const _Str_17787:int = 7;

        public function WiredRewardResultMessageEvent(k:Function)
        {
            super(k, WiredRewardResultMessageParser);
        }

        public function getParser():WiredRewardResultMessageParser
        {
            return this._parser as WiredRewardResultMessageParser;
        }
    }
}
