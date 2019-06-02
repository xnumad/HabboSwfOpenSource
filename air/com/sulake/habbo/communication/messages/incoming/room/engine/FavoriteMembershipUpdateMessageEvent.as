//com.sulake.habbo.communication.messages.incoming.room.engine.FavoriteMembershipUpdateMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.engine{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.FavouriteMembershipUpdateMessageParser;

    [SecureSWF(rename="true")]
    public class FavoriteMembershipUpdateMessageEvent extends MessageEvent {

        public function FavoriteMembershipUpdateMessageEvent(k:Function);

        public function getParser():FavouriteMembershipUpdateMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.engine

