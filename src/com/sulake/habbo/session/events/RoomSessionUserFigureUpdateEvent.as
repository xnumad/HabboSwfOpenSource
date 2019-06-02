package com.sulake.habbo.session.events
{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionUserFigureUpdateEvent extends RoomSessionEvent 
    {
        public static const RSUBE_FIGURE:String = "RSUBE_FIGURE";

        private var _userId:int = 0;
        private var _figure:String = "";
        private var _gender:String = "";
        private var _customInfo:String = "";
        private var _achievementScore:int;

        public function RoomSessionUserFigureUpdateEvent(k:IRoomSession, _arg_2:int, _arg_3:String, _arg_4:String, _arg_5:String, _arg_6:int, _arg_7:Boolean=false, _arg_8:Boolean=false)
        {
            super(RSUBE_FIGURE, k, _arg_7, _arg_8);
            this._userId = _arg_2;
            this._figure = _arg_3;
            this._gender = _arg_4;
            this._customInfo = _arg_5;
            this._achievementScore = _arg_6;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get figure():String
        {
            return this._figure;
        }

        public function get gender():String
        {
            return this._gender;
        }

        public function get customInfo():String
        {
            return this._customInfo;
        }

        public function get activityPoints():int
        {
            return this._achievementScore;
        }
    }
}
