package com.sulake.habbo.communication.messages.outgoing.users
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class GetHabboGroupDetailsMessageComposer implements IMessageComposer
    {
        private var _data:Array;

        public function GetHabboGroupDetailsMessageComposer(k:int, _arg_2:Boolean)
        {
            this._data = [];
            super();
            this._data.push(k);
            this._data.push(_arg_2);
        }

        public function dispose():void
        {
            this._data = null;
        }

        public function getMessageArray():Array
        {
            return this._data;
        }
    }
}
