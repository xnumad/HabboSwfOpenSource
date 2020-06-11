package com.sulake.habbo.session.events
{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionPollEvent extends RoomSessionEvent
    {
        public static const RSPE_POLL_OFFER:String = "RSPE_POLL_OFFER";
        public static const ERROR:String = "RSPE_POLL_ERROR";
        public static const RSPE_POLL_CONTENT:String = "RSPE_POLL_CONTENT";

        private var _id:int = -1;
        private var _headline:String;
        private var _summary:String;
        private var _numQuestions:int = 0;
        private var _startMessage:String = "";
        private var _endMessage:String = "";
        private var _questionArray:Array = null;
        private var _npsPoll:Boolean = false;

        public function RoomSessionPollEvent(k:String, _arg_2:IRoomSession, _arg_3:int)
        {
            this._id = _arg_3;
            super(k, _arg_2);
        }

        public function get id():int
        {
            return this._id;
        }

        public function get headline():String
        {
            return this._headline;
        }

        public function set headline(k:String):void
        {
            this._headline = k;
        }

        public function get summary():String
        {
            return this._summary;
        }

        public function set summary(k:String):void
        {
            this._summary = k;
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
