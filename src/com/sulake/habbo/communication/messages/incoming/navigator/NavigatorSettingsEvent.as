package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.NavigatorSettingsMessageParser;

    public class NavigatorSettingsEvent extends MessageEvent implements IMessageEvent
    {
        public function NavigatorSettingsEvent(k:Function)
        {
            super(k, NavigatorSettingsMessageParser);
        }

        public function getParser():NavigatorSettingsMessageParser
        {
            return this._parser as NavigatorSettingsMessageParser;
        }
    }
}
