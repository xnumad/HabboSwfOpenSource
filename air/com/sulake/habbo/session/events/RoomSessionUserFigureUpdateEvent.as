//com.sulake.habbo.session.events.RoomSessionUserFigureUpdateEvent

package com.sulake.habbo.session.events{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionUserFigureUpdateEvent extends RoomSessionEvent {

        public static const USER_FIGURE:String;

        private var _userId:int;
        private var _figure:String;
        private var _gender:String;
        private var _customInfo:String;
        private var _achievementScore:int;

        public function RoomSessionUserFigureUpdateEvent(k:IRoomSession, _arg_2:int, _arg_3:String, _arg_4:String, _arg_5:String, _arg_6:int, _arg_7:Boolean=false, _arg_8:Boolean=false);

        public function get userId():int;

        public function get figure():String;

        public function get gender():String;

        public function get customInfo():String;

        public function get achievementScore():int;


    }
}//package com.sulake.habbo.session.events

