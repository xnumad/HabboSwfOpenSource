//com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.WiredRewardResultMessageEvent

package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.userdefinedroomevents.WiredRewardResultMessageParser;

    public class WiredRewardResultMessageEvent extends MessageEvent implements IMessageEvent {

        public static const PRODUCT_DONATED_CODE:int;
        public static const BADGE_DONATED_CODE:int;

        public function WiredRewardResultMessageEvent(k:Function);

        public function getParser():WiredRewardResultMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents

