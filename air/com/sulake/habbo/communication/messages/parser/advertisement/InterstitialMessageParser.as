//com.sulake.habbo.communication.messages.parser.advertisement.InterstitialMessageParser

package com.sulake.habbo.communication.messages.parser.advertisement{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class InterstitialMessageParser implements IMessageParser {

        private var _imageUrl:String;
        private var _clickUrl:String;
        private var _videoUrl:String;

        public function InterstitialMessageParser();

        public function get imageUrl():String;

        public function get clickUrl():String;

        public function get videoUrl():String;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.advertisement

