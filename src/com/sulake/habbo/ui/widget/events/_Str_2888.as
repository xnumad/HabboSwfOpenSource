package com.sulake.habbo.ui.widget.events
{
    public class _Str_2888 extends RoomWidgetUpdateEvent 
    {
        public static const RWPUW_OFFER:String = "RWPUW_OFFER";
        public static const ERROR:String = "RWPUW_ERROR";
        public static const RWPUW_CONTENT:String = "RWPUW_CONTENT";

        private var _id:int = -1;
        private var _summary:String;
        private var _headline:String;
        private var _Str_5366:int = 0;
        private var _Str_5879:String = "";
        private var _Str_4781:String = "";
        private var _Str_5432:Array = null;
        private var _Str_20371:String = "";
        private var _Str_4353:Boolean = false;

        public function _Str_2888(k:int, _arg_2:String, _arg_3:Boolean=false, _arg_4:Boolean=false)
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

        public function get _Str_6760():int
        {
            return this._Str_5366;
        }

        public function set _Str_6760(k:int):void
        {
            this._Str_5366 = k;
        }

        public function get _Str_6013():String
        {
            return this._Str_5879;
        }

        public function set _Str_6013(k:String):void
        {
            this._Str_5879 = k;
        }

        public function get _Str_5838():String
        {
            return this._Str_4781;
        }

        public function set _Str_5838(k:String):void
        {
            this._Str_4781 = k;
        }

        public function get _Str_5643():Array
        {
            return this._Str_5432;
        }

        public function set _Str_5643(k:Array):void
        {
            this._Str_5432 = k;
        }

        public function get _Str_5302():String
        {
            return this._Str_20371;
        }

        public function set _Str_5302(k:String):void
        {
            this._Str_20371 = k;
        }

        public function get _Str_6196():Boolean
        {
            return this._Str_4353;
        }

        public function set _Str_6196(k:Boolean):void
        {
            this._Str_4353 = k;
        }
    }
}
