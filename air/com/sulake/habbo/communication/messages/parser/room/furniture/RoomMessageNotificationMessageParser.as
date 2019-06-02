//com.sulake.habbo.communication.messages.parser.room.furniture.RoomMessageNotificationMessageParser

package com.sulake.habbo.communication.messages.parser.room.furniture{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class RoomMessageNotificationMessageParser implements IMessageParser {

        private var _roomId:int;
        private var _roomName:String;
        private var _messageCount:int;

        public function RoomMessageNotificationMessageParser();

        public function get roomId():int;

        public function get roomName():String;

        public function get messageCount():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.furniture

