package com.sulake.habbo.communication.messages.outgoing.help
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class PostQuizAnswersComposer implements IMessageComposer 
    {
        private var _array:Array;

        public function PostQuizAnswersComposer(k:String, _arg_2:Array)
        {
            this._array = [];
            super();
            this._array.push(k);
            this._array.push(_arg_2.length);
            var _local_3:int;
            while (_local_3 < _arg_2.length)
            {
                this._array.push(_arg_2[_local_3]);
                _local_3++;
            }
        }

        public function getMessageArray():Array
        {
            return this._array;
        }

        public function dispose():void
        {
            this._array = null;
        }
    }
}
