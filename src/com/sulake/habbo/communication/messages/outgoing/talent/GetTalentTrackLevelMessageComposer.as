package com.sulake.habbo.communication.messages.outgoing.talent
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class GetTalentTrackLevelMessageComposer implements IMessageComposer
    {
        private var _data:Array;

        public function GetTalentTrackLevelMessageComposer(k:String)
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
