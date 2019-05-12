package com.sulake.habbo.session.events 
{
	import com.sulake.habbo.session.IRoomSession;
	/**
	 * ...
	 * @author 
	 */
	public class RoomSessionPollEvent extends RoomSessionEvent
	{
		public static const VOTE_QUESTION:String = "RSPE_VOTE_QUESTION";
        public static const VOTE_RESULT:String = "RSPE_VOTE_RESULT";
		
		private var _question:String = "";
        private var _choices:Array;
        private var _SafeStr_7651:Array;
        private var _SafeStr_7654:int = 0;
		
		public function RoomSessionPollEvent(_arg_1:String, _arg_2:IRoomSession, _arg_3:String, _arg_4:Array, _arg_5:Array=null, _arg_6:int=0, _arg_7:Boolean=false, _arg_8:Boolean=false) 
		{
			this._choices = [];
            this._SafeStr_7651 = [];
            super(_arg_1, _arg_2, _arg_7, _arg_8);
            this._question = _arg_3;
            this._choices = _arg_4;
            this._SafeStr_7651 = _arg_5;
            if (this._SafeStr_7651 == null)
            {
                this._SafeStr_7651 = [];
            }
            this._SafeStr_7654 = _arg_6;
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
            return this._SafeStr_7651.slice();
        }

        public function get _SafeStr_4174():int
        {
            return this._SafeStr_7654;
        }
	}

}
