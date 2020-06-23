package com.sulake.habbo.communication.messages.outgoing.room.session
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class OpenFlatConnectionMessageComposer implements IMessageComposer
    {
        private var _Str_1518:Array;

        public function OpenFlatConnectionMessageComposer(k:int, _arg_2:String="", _arg_3:int=-1)
        {
            this._Str_1518 = [k, _arg_2, _arg_3];
        }

        public function dispose():void
        {
            this._Str_1518 = null;
        }

        public function getMessageArray():Array
        {
            return this._Str_1518;
        }
    }
}
