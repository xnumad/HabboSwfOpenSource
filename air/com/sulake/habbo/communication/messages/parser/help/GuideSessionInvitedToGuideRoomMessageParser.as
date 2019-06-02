//com.sulake.habbo.communication.messages.parser.help.GuideSessionInvitedToGuideRoomMessageParser

package com.sulake.habbo.communication.messages.parser.help{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class GuideSessionInvitedToGuideRoomMessageParser implements IMessageParser {

        private var _roomId:int;
        private var _roomName:String;

        public function GuideSessionInvitedToGuideRoomMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function getRoomId():int;

        public function getRoomName():String;


    }
}//package com.sulake.habbo.communication.messages.parser.help

