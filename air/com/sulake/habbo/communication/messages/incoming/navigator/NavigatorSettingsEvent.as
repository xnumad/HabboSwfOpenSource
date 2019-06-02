//com.sulake.habbo.communication.messages.incoming.navigator.NavigatorSettingsEvent

package com.sulake.habbo.communication.messages.incoming.navigator{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.NavigatorSettingsMessageParser;

    [SecureSWF(rename="true")]
    public class NavigatorSettingsEvent extends MessageEvent implements IMessageEvent {

        public function NavigatorSettingsEvent(k:Function);

        public function getParser():NavigatorSettingsMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.navigator

