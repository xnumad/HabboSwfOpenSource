package com.sulake.habbo.communication.messages.outgoing.quest
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class AcceptQuestMessageComposer implements IMessageComposer 
    {
        private var _data:Array;

        public function AcceptQuestMessageComposer(k:int)
        {
            this._data = [];
            super();
            this._data.push(k);
        }

        public function getMessageArray():Array
        {
            return this._data;
        }

        public function dispose():void
        {
            this._data = null;
        }
    }
}
