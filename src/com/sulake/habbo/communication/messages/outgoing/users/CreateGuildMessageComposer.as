package com.sulake.habbo.communication.messages.outgoing.users
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class CreateGuildMessageComposer implements IMessageComposer 
    {
        private var _data:Array;

        public function CreateGuildMessageComposer(k:String, _arg_2:String, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:Array)
        {
            this._data = [];
            super();
            this._data.push(k);
            this._data.push(_arg_2);
            this._data.push(_arg_3);
            this._data.push(_arg_4);
            this._data.push(_arg_5);
            this._data.push(_arg_6.length);
            var _local_7:int;
            while (_local_7 < _arg_6.length)
            {
                this._data.push(int(_arg_6[_local_7]));
                _local_7++;
            }
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
