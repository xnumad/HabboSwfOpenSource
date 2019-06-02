//com.sulake.habbo.session.events.RoomSessionPollEvent

package com.sulake.habbo.session.events{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionPollEvent extends RoomSessionEvent {

        public static const OFFER:String;
        public static const ERROR:String;
        public static const CONTENT:String;

        private var _id:int;
        private var _summary:String;
        private var _numQuestions:int;
        private var _startMessage:String;
        private var _endMessage:String;
        private var _questionArray:Array;

        public function RoomSessionPollEvent(k:String, _arg_2:IRoomSession, _arg_3:int);

        public function get id():int;

        public function get summary():String;

        public function set summary(k:String):void;

        public function get numQuestions():int;

        public function set numQuestions(k:int):void;

        public function get startMessage():String;

        public function set startMessage(k:String):void;

        public function get endMessage():String;

        public function set endMessage(k:String):void;

        public function get questionArray():Array;

        public function set questionArray(k:Array):void;


    }
}//package com.sulake.habbo.session.events

