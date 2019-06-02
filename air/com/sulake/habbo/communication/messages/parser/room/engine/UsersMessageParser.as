//com.sulake.habbo.communication.messages.parser.room.engine.UsersMessageParser

package com.sulake.habbo.communication.messages.parser.room.engine{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.room.engine.UserMessageData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class UsersMessageParser implements IMessageParser {

        private var _users:Array;

        public function UsersMessageParser();

        public static function convertOldPetFigure(k:String):String;


        public function flush():Boolean;

        public function getUserCount():int;

        public function getUser(k:int):UserMessageData;

        public function parse(k:IMessageDataWrapper):Boolean;

        private function resolveSex(k:String):String;

        private function convertSwimFigure(k:String, _arg_2:String, _arg_3:String):String;


    }
}//package com.sulake.habbo.communication.messages.parser.room.engine

