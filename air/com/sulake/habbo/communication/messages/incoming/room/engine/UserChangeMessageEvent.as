//com.sulake.habbo.communication.messages.incoming.room.engine.UserChangeMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.engine{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;

    [SecureSWF(rename="true")]
    public class UserChangeMessageEvent extends MessageEvent implements IMessageEvent {

        public function UserChangeMessageEvent(k:Function);

        public function get id():int;

        public function get figure():String;

        public function get sex():String;

        public function get customInfo():String;

        public function get achievementScore():int;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.engine

