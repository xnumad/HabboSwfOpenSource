package com.sulake.habbo.communication.messages.outgoing.competition
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class ForwardToACompetitionRoomMessageComposer implements IMessageComposer
    {
        private var _array:Array;

        public function ForwardToACompetitionRoomMessageComposer(k:String, _arg_2:int)
        {
            this._array = new Array();
            super();
            this._array.push(k);
            this._array.push(_arg_2);
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
