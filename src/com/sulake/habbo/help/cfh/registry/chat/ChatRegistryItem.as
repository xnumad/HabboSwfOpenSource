package com.sulake.habbo.help.cfh.registry.chat
{
    public class ChatRegistryItem 
    {
        private var _userId:int;
        private var _userName:String = "";
        private var _text:String = "";
        private var _roomId:int;
        private var _roomName:String = "";
        private var _selected:Boolean;
        private var _index:uint;
        private var _chatTime:Date;

        public function ChatRegistryItem(k:uint, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:String, _arg_6:String)
        {
            this._index = k;
            this._roomId = _arg_2;
            this._roomName = _arg_3;
            this._userId = _arg_4;
            this._userName = _arg_5;
            this._text = _arg_6;
            this._selected = false;
            this._chatTime = new Date();
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get userName():String
        {
            return this._userName;
        }

        public function get text():String
        {
            return this._text;
        }

        public function get roomId():int
        {
            return this._roomId;
        }

        public function get roomName():String
        {
            return this._roomName;
        }

        public function get selected():Boolean
        {
            return this._selected;
        }

        public function set selected(selected:Boolean):void
        {
            this._selected = selected;
        }

        public function get index():int
        {
            return this._index;
        }

        public function get chatTime():Date
        {
            return this._chatTime;
        }
    }
}
