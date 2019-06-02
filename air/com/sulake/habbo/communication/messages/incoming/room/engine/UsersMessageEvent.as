//com.sulake.habbo.communication.messages.incoming.room.engine.UsersMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.engine{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine.UsersMessageParser;

    [SecureSWF(rename="true")]
    public class UsersMessageEvent extends MessageEvent implements IMessageEvent {

        public function UsersMessageEvent(k:Function);

        public function getParser():UsersMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.engine

