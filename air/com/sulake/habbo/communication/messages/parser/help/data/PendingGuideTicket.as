//com.sulake.habbo.communication.messages.parser.help.data.PendingGuideTicket

package com.sulake.habbo.communication.messages.parser.help.data{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PendingGuideTicket {

        private var _type:int;
        private var _secondsAgo:int;
        private var _isGuide:Boolean;
        private var _otherPartyName:String;
        private var _otherPartyFigure:String;
        private var _description:String;
        private var _roomName:String;

        public function PendingGuideTicket(k:IMessageDataWrapper):void;

        public function get type():int;

        public function get secondsAgo():int;

        public function get isGuide():Boolean;

        public function get otherPartyName():String;

        public function get otherPartyFigure():String;

        public function get description():String;

        public function get roomName():String;


    }
}//package com.sulake.habbo.communication.messages.parser.help.data

