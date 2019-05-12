package com.sulake.habbo.communication.messages.outgoing.camera
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class PhotoCompetitionMessageComposer implements IMessageComposer 
    {
        private var _data:Array;

        public function PhotoCompetitionMessageComposer()
        {
            this._data = [];
            super();
        }

        public function getMessageArray():Array
        {
            return this._data;
        }

        public function dispose():void
        {
            this._data = [];
        }
    }
}
