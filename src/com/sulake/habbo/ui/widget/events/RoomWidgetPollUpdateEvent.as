package com.sulake.habbo.ui.widget.events 
{
	public class RoomWidgetPollUpdateEvent extends RoomWidgetUpdateEvent
	{
		
		public static const VOTE_QUESTION:String = "RWPUE_VOTE_QUESTION"; //_SafeStr_4171
        public static const VOTE_RESULT:String = "RWPUE_VOTE_RESULT"; //_SafeStr_4172

        private var _question:String;
        private var _choices:Array;
        private var _SafeStr_7651:Array;
        private var _SafeStr_7654:int;

        public function RoomWidgetPollUpdateEvent(_arg_1:String, _arg_2:String, _arg_3:Array, _arg_4:Array=null, _arg_5:int=0, _arg_6:Boolean=false, _arg_7:Boolean=false)
        {
            super(_arg_1, _arg_6, _arg_7);
            this._question = _arg_2;
            this._choices = _arg_3;
            this._SafeStr_7651 = _arg_4;
            if (this._SafeStr_7651 == null)
            {
                this._SafeStr_7651 = [];
            }
            this._SafeStr_7654 = _arg_5;
        }

        public function get question():String
        {
            return this._question;
        }

        public function get choices():Array
        {
            return this._choices.slice();
        }

        public function get _SafeStr_4173():Array
        {
            return (this._SafeStr_7651.slice()); //Results?
        }

        public function get _SafeStr_4174():int
        {
            return (this._SafeStr_7654); //Timer?
        }
	}
}
