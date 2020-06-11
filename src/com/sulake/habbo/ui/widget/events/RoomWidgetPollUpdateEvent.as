package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetPollUpdateEvent extends RoomWidgetUpdateEvent
    {
        public static const RWPUW_OFFER:String = "RWPUW_OFFER";
        public static const ERROR:String = "RWPUW_ERROR";
        public static const RWPUW_CONTENT:String = "RWPUW_CONTENT";

        private var _id:int = -1;
        private var _summary:String;
        private var _headline:String;
        private var _numQuestions:int = 0;
        private var _startMessage:String = "";
        private var _endMessage:String = "";
        private var _questionArray:Array = null;
        private var _pollType:String = "";
        private var _npsPoll:Boolean = false;

        public function RoomWidgetPollUpdateEvent(k:int, _arg_2:String, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            this._id = k;
            super(_arg_2, _arg_3, _arg_4);
        }

        public function get id():int
        {
            return this._id;
        }

        public function get summary():String
        {
            return this._summary;
        }

        public function set summary(k:String):void
        {
            this._summary = k;
        }

        public function get headline():String
        {
            return this._headline;
        }

        public function set headline(k:String):void
        {
            this._headline = k;
        }

        public function get numQuestions():int
        {
            return this._numQuestions;
        }

        public function set numQuestions(k:int):void
        {
            this._numQuestions = k;
        }

        public function get _Str_6013():String
        {
            return this._startMessage;
        }

        public function set _Str_6013(k:String):void
        {
            this._startMessage = k;
        }

        public function get _Str_5838():String
        {
            return this._endMessage;
        }

        public function set _Str_5838(k:String):void
        {
            this._endMessage = k;
        }

        public function get _Str_5643():Array
        {
            return this._questionArray;
        }

        public function set _Str_5643(k:Array):void
        {
            this._questionArray = k;
        }

        public function get pollType():String
        {
            return this._pollType;
        }

        public function set pollType(k:String):void
        {
            this._pollType = k;
        }

        public function get _Str_6196():Boolean
        {
            return this._npsPoll;
        }

        public function set _Str_6196(k:Boolean):void
        {
            this._npsPoll = k;
        }
    }
}
