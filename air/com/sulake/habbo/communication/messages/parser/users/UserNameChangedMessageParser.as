//com.sulake.habbo.communication.messages.parser.users.UserNameChangedMessageParser

package com.sulake.habbo.communication.messages.parser.users{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class UserNameChangedMessageParser implements IMessageParser {

        private var _webId:int;
        private var _id:int;
        private var _newName:String;

        public function UserNameChangedMessageParser();

        public function get webId():int;

        public function get id():int;

        public function get newName():String;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.users

