package com.sulake.habbo.communication.messages.outgoing.register
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class UpdateFigureDataMessageComposer implements IMessageComposer
    {
        private var _data:Array;

        public function UpdateFigureDataMessageComposer(k:String, _arg_2:String)
        {
            this._data = [];
            super();
            this._data.push(_arg_2);
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
