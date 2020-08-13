package com.sulake.habbo.communication.messages.outgoing.competition
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class ForwardToRandomCompetitionRoomMessageComposer implements IMessageComposer
    {
        private var _array:Array;

        public function ForwardToRandomCompetitionRoomMessageComposer(k:String)
        {
            this._array = new Array();
            super();
            this._array.push(k);
        }

        public function getMessageArray():Array
        {
            return this._array;
        }

        public function dispose():void
        {
            this._array = null;
        }

        public function get disposed():Boolean
        {
            return false;
        }
    }
}
