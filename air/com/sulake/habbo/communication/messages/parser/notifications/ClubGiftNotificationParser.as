//com.sulake.habbo.communication.messages.parser.notifications.ClubGiftNotificationParser

package com.sulake.habbo.communication.messages.parser.notifications{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ClubGiftNotificationParser implements IMessageParser {

        private var _numGifts:int;

        public function ClubGiftNotificationParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get numGifts():int;


    }
}//package com.sulake.habbo.communication.messages.parser.notifications

