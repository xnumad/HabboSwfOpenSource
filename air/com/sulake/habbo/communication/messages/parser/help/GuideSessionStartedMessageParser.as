//com.sulake.habbo.communication.messages.parser.help.GuideSessionStartedMessageParser

package com.sulake.habbo.communication.messages.parser.help{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class GuideSessionStartedMessageParser implements IMessageParser {

        private var _requesterUserId:int;
        private var _requesterName:String;
        private var _requesterFigure:String;
        private var _guideUserId:int;
        private var _guideName:String;
        private var _guideFigure:String;

        public function GuideSessionStartedMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get requesterUserId():int;

        public function get requesterName():String;

        public function get requesterFigure():String;

        public function get guideUserId():int;

        public function get guideName():String;

        public function get guideFigure():String;


    }
}//package com.sulake.habbo.communication.messages.parser.help

