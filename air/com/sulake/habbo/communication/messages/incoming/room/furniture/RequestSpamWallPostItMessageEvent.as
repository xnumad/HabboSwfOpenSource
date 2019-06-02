//com.sulake.habbo.communication.messages.incoming.room.furniture.RequestSpamWallPostItMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.furniture{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture.RequestSpamWallPostItMessageParser;

    [SecureSWF(rename="true")]
    public class RequestSpamWallPostItMessageEvent extends MessageEvent implements IMessageEvent {

        public function RequestSpamWallPostItMessageEvent(k:Function);

        public function getParser():RequestSpamWallPostItMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.furniture

