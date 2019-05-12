package com.sulake.habbo.communication.messages.incoming.roomsettings
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_4114 implements _Str_4633 
    {
        private var _userId:int;
        private var _userName:String;
        private var _selected:Boolean;

        public function _Str_4114(k:IMessageDataWrapper)
        {
            this._userId = k.readInteger();
            this._userName = k.readString();
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get userName():String
        {
            return this._userName;
        }

        public function get selected():Boolean
        {
            return this._selected;
        }

        public function set selected(k:Boolean):void
        {
            this._selected = k;
        }
    }
}
