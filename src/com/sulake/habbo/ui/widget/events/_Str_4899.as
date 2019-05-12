package com.sulake.habbo.ui.widget.events
{
    public class _Str_4899 extends RoomWidgetUpdateEvent 
    {
        public static const RWCFUE_CREDIT_FURNI_UPDATE:String = "RWCFUE_CREDIT_FURNI_UPDATE";

        private var _Str_2319:int;
        private var _Str_12356:Number;
		private var _furniType:String;
        public function _Str_4899(k:String, furniType:String, _arg_2:int, _arg_3:Number, _arg_4:Boolean=false, _arg_5:Boolean=false)
        {
            super(k, _arg_4, _arg_5);
            this._Str_12356 = _arg_3;
            this._Str_2319 = _arg_2;
			this._furniType = furniType;
        }

        public function get _Str_22599():Number
        {
            return this._Str_12356;
        }

        public function get _Str_1577():int
        {
            return this._Str_2319;
        }

		public function get furniType():String
		{
			return this._furniType;
		}    }
}
