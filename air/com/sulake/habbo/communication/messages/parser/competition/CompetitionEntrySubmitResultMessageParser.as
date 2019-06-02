//com.sulake.habbo.communication.messages.parser.competition.CompetitionEntrySubmitResultMessageParser

package com.sulake.habbo.communication.messages.parser.competition{
    import com.sulake.core.communication.messages.IMessageParser;
    import flash.utils.Dictionary;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class CompetitionEntrySubmitResultMessageParser implements IMessageParser {

        public static const SUBMITTED:int;
        public static const ASK_FOR_SUBMIT:int;
        public static const ASK_FOR_CONFIRM:int;
        public static const PREREQUISITES_NOT_MET:int;
        public static const ROOM_DOOR_NOT_OPEN:int;
        public static const ROOM_TOO_OLD:int;
        public static const ASK_FOR_ACCEPT_RULES:int;

        private var _goalId:int;
        private var _goalCode:String;
        private var _result:int;
        private var _requiredFurnis:Array;
        private var _missingFurnis:Dictionary;

        public function CompetitionEntrySubmitResultMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get goalId():int;

        public function get goalCode():String;

        public function get result():int;

        public function get requiredFurnis():Array;

        public function isMissing(k:String):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.competition

