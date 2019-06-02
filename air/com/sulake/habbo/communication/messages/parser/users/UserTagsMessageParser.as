//com.sulake.habbo.communication.messages.parser.users.UserTagsMessageParser

package com.sulake.habbo.communication.messages.parser.users{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class UserTagsMessageParser implements IMessageParser {

        protected var _tags:Array;
        protected var _userId:int;

        public function UserTagsMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get tags():Array;

        public function get userId():int;


    }
}//package com.sulake.habbo.communication.messages.parser.users

