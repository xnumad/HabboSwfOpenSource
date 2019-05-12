package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_9899 implements IMessageComposer 
    {
        private var _Str_12368:int;
        private var _Str_11437:int;
        private var _Str_19730:String;
        private var _Str_20971:int;
        private var _Str_22039:Boolean;

        public function _Str_9899(k:int, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:Boolean)
        {
            this._Str_12368 = k;
            this._Str_11437 = _arg_2;
            this._Str_19730 = _arg_3;
            this._Str_20971 = _arg_4;
            this._Str_22039 = _arg_5;
        }

        public function getMessageArray():Array
        {
            return [this._Str_12368, this._Str_11437, this._Str_19730, this._Str_20971, this._Str_22039];
        }

        public function dispose():void
        {
        }
    }
}
