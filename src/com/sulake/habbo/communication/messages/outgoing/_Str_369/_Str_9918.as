package com.sulake.habbo.communication.messages.outgoing._Str_369
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_9918 implements IMessageComposer 
    {
        private var _Str_2907:Array;

        public function _Str_9918(k:String, _arg_2:int)
        {
            this._Str_2907 = [];
            super();
            this._Str_2907 = [k, _arg_2];
        }

        public function getMessageArray():Array
        {
            return this._Str_2907;
        }

        public function dispose():void
        {
            this._Str_2907 = null;
        }
    }
}
