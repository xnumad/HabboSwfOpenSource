package com.sulake.habbo.communication.messages.incoming.preferences
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.preferences.AccountPreferencesParser;

    public class _Str_3870 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_3870(k:Function)
        {
            super(k, AccountPreferencesParser);
        }

        public function getParser():AccountPreferencesParser
        {
            return this._parser as AccountPreferencesParser;
        }
    }
}
