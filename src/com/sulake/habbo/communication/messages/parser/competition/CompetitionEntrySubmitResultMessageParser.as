package com.sulake.habbo.communication.messages.parser.competition
{
    import com.sulake.core.communication.messages.IMessageParser;
    import flash.utils.Dictionary;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CompetitionEntrySubmitResultMessageParser implements IMessageParser 
    {
        public static const SUBMITTED:int = 0;
        public static const ASK_FOR_SUBMIT:int = 1;
        public static const ASK_FOR_CONFIRM:int = 2;
        public static const PREREQUISITES_NOT_MET:int = 3;
        public static const ROOM_DOOR_NOT_OPEN:int = 4;
        public static const ROOM_TOO_OLD:int = 5;
        public static const ASK_FOR_ACCEPT_RULES:int = 6;

        private var _goalId:int;
        private var _goalCode:String;
        private var _result:int;
        private var _requiredFurnis:Array;
        private var _missingFurnis:Dictionary;


        public function flush():Boolean
        {
            this._requiredFurnis = null;
            this._missingFurnis = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._goalId = k.readInteger();
            this._goalCode = k.readString();
            this._result = k.readInteger();
            this._requiredFurnis = [];
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._requiredFurnis.push(k.readString());
                _local_3++;
            }
            this._missingFurnis = new Dictionary();
            _local_2 = k.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                this._missingFurnis[k.readString()] = "";
                _local_3++;
            }
            return true;
        }

        public function get goalId():int
        {
            return this._goalId;
        }

        public function get goalCode():String
        {
            return this._goalCode;
        }

        public function get result():int
        {
            return this._result;
        }

        public function get requiredFurnis():Array
        {
            return this._requiredFurnis;
        }

        public function isMissing(k:String):Boolean
        {
            return !(this._missingFurnis[k] == null);
        }
    }
}
