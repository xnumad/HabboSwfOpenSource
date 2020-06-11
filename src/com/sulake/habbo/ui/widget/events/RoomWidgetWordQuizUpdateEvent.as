package com.sulake.habbo.ui.widget.events
{
    import flash.utils.Dictionary;
    import com.sulake.core.utils.Map;

    public class RoomWidgetWordQuizUpdateEvent extends RoomWidgetUpdateEvent
    {
        public static const RWPUW_NEW_QUESTION:String = "RWPUW_NEW_QUESTION";
        public static const RWPUW_QUESION_FINSIHED:String = "RWPUW_QUESION_FINSIHED";
        public static const RWPUW_QUESTION_ANSWERED:String = "RWPUW_QUESTION_ANSWERED";

        private var _id:int = -1;
        private var _pollType:String = null;
        private var _pollId:int = -1;
        private var _questionId:int = -1;
        private var _duration:int = -1;
        private var _question:Dictionary = null;
        private var _userId:int = -1;
        private var _value:String;
        private var _answerCounts:Map;

        public function RoomWidgetWordQuizUpdateEvent(k:int, _arg_2:String, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            this._id = k;
            super(_arg_2, _arg_3, _arg_4);
        }

        public function get id():int
        {
            return this._id;
        }

        public function get pollType():String
        {
            return this._pollType;
        }

        public function set pollType(k:String):void
        {
            this._pollType = k;
        }

        public function get pollId():int
        {
            return this._pollId;
        }

        public function set pollId(k:int):void
        {
            this._pollId = k;
        }

        public function get questionId():int
        {
            return this._questionId;
        }

        public function set questionId(k:int):void
        {
            this._questionId = k;
        }

        public function get duration():int
        {
            return this._duration;
        }

        public function set duration(k:int):void
        {
            this._duration = k;
        }

        public function get question():Dictionary
        {
            return this._question;
        }

        public function set question(k:Dictionary):void
        {
            this._question = k;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function set userId(k:int):void
        {
            this._userId = k;
        }

        public function get value():String
        {
            return this._value;
        }

        public function set value(k:String):void
        {
            this._value = k;
        }

        public function get answerCounts():Map
        {
            return this._answerCounts;
        }

        public function set answerCounts(k:Map):void
        {
            this._answerCounts = k;
        }
    }
}
