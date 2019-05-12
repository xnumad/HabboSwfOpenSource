package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetPollMessage extends RoomWidgetMessage 
    {
        public static const RWPM_START:String = "RWPM_START";
        public static const RWPM_REJECT:String = "RWPM_REJECT";
        public static const RWPM_ANSWER:String = "RWPM_ANSWER";

        private var _id:int = -1;
        private var _questionId:int = 0;
        private var _answers:Array = null;

        public function RoomWidgetPollMessage(k:String, _arg_2:int)
        {
            this._id = _arg_2;
            super(k);
        }

        public function get id():int
        {
            return this._id;
        }

        public function get _Str_3218():int
        {
            return this._questionId;
        }

        public function set _Str_3218(k:int):void
        {
            this._questionId = k;
        }

        public function get answers():Array
        {
            return this._answers;
        }

        public function set answers(k:Array):void
        {
            this._answers = k;
        }
    }
}
