package com.sulake.habbo.communication.messages.outgoing.poll
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class PollAnswerComposer implements IMessageComposer 
    {
        private var _data:Array;

        public function PollAnswerComposer(k:int, _arg_2:int, _arg_3:Array)
        {
            this._data = [k, _arg_2];
            this._data.push(_arg_3.length);
            var _local_4:int;
            while (_local_4 < _arg_3.length)
            {
                this._data.push(String(_arg_3[_local_4]));
                _local_4++;
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
