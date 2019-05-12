package com.sulake.habbo.help.cfh.registry.instantmessage
{
    public class InstantMessageRegistryItem 
    {
        private var _index:int;
        private var _userId:int;
        private var _username:String = "";
        private var _chatText:String = "";
        private var _chatTime:Date;
        private var _selected:Boolean;

        public function InstantMessageRegistryItem(k:int, _arg_2:int, _arg_3:String, _arg_4:String)
        {
            this._index = k;
            this._userId = _arg_2;
            this._username = _arg_3;
            this._chatText = _arg_4;
            this._selected = false;
            this._chatTime = new Date();
        }

        public function get index():int
        {
            return this._index;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get userName():String
        {
            return this._username;
        }

        public function get text():String
        {
            return this._chatText;
        }

        public function get selected():Boolean
        {
            return this._selected;
        }

        public function set selected(selected:Boolean):void
        {
            this._selected = selected;
        }

        public function get chatTime():Date
        {
            return this._chatTime;
        }
    }
}
