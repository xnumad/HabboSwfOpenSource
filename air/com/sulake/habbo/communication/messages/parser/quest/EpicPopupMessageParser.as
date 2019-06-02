//com.sulake.habbo.communication.messages.parser.quest.EpicPopupMessageParser

package com.sulake.habbo.communication.messages.parser.quest{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class EpicPopupMessageParser implements IMessageParser {

        private var _imageUri:String;

        public function EpicPopupMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get imageUri():String;


    }
}//package com.sulake.habbo.communication.messages.parser.quest

