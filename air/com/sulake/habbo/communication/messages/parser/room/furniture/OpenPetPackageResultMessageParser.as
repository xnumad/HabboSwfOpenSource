//com.sulake.habbo.communication.messages.parser.room.furniture.OpenPetPackageResultMessageParser

package com.sulake.habbo.communication.messages.parser.room.furniture{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class OpenPetPackageResultMessageParser implements IMessageParser {

        private var _objectId:int;
        private var _nameValidationStatus:int;
        private var _nameValidationInfo:String;

        public function OpenPetPackageResultMessageParser();

        public function get objectId():int;

        public function get nameValidationStatus():int;

        public function get nameValidationInfo():String;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.furniture

