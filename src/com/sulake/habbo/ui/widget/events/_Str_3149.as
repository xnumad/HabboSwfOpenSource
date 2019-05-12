package com.sulake.habbo.ui.widget.events
{
    import flash.utils.Dictionary;
    import com.sulake.core.utils.Map;

    public class _Str_3149 extends RoomWidgetUpdateEvent 
    {
        public static const RWPUW_NEW_QUESTION:String = "RWPUW_NEW_QUESTION";
        public static const RWPUW_QUESION_FINSIHED:String = "RWPUW_QUESION_FINSIHED";
        public static const RWPUW_QUESTION_ANSWERED:String = "RWPUW_QUESTION_ANSWERED";

        private var _id:int = -1;
        private var _Str_5702:String = null;
        private var _Str_4354:int = -1;
        private var _Str_3128:int = -1;
        private var _duration:int = -1;
        private var _question:Dictionary = null;
        private var _userId:int = -1;
        private var _value:String;
        private var _Str_4154:Map;

        public function _Str_3149(k:int, _arg_2:String, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            this._id = k;
            super(_arg_2, _arg_3, _arg_4);
        }

        public function get id():int
        {
            return this._id;
        }

        public function get _Str_5302():String
        {
            return this._Str_5702;
        }

        public function set _Str_5302(k:String):void
        {
            this._Str_5702 = k;
        }

        public function get _Str_5213():int
        {
            return this._Str_4354;
        }

        public function set _Str_5213(k:int):void
        {
            this._Str_4354 = k;
        }

        public function get _Str_3218():int
        {
            return this._Str_3128;
        }

        public function set _Str_3218(k:int):void
        {
            this._Str_3128 = k;
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

        public function get _Str_4036():Map
        {
            return this._Str_4154;
        }

        public function set _Str_4036(k:Map):void
        {
            this._Str_4154 = k;
        }
    }
}
