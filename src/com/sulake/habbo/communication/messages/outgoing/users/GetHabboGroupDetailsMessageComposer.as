package com.sulake.habbo.communication.messages.outgoing.users
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class GetHabboGroupDetailsMessageComposer implements IMessageComposer
    {
        private var _data:Array;

        public function GetHabboGroupDetailsMessageComposer(groupId:int, openDetails:Boolean)
        {
            this._data = [];
            super();
            this._data.push(groupId);
            this._data.push(openDetails);
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
