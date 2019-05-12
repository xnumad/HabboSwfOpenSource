package com.sulake.habbo.communication.messages.outgoing.users
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class UpdateGuildBadgeMessageComposer implements IMessageComposer 
    {
        private var _data:Array;

        public function UpdateGuildBadgeMessageComposer(k:int, _arg_2:Array)
        {
            this._data = [];
            super();
            this._data.push(k);
            this._data.push(_arg_2.length);
            var _local_3:int;
            while (_local_3 < _arg_2.length)
            {
                this._data.push(int(_arg_2[_local_3]));
                _local_3++;
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
