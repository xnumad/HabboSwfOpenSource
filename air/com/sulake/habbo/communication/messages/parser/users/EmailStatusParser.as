//com.sulake.habbo.communication.messages.parser.users.EmailStatusParser

package com.sulake.habbo.communication.messages.parser.users{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class EmailStatusParser implements IMessageParser {

        private var _email:String;
        private var _isVerified:Boolean;
        private var _allowChange:Boolean;

        public function EmailStatusParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get email():String;

        public function get isVerified():Boolean;

        public function get allowChange():Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.users

