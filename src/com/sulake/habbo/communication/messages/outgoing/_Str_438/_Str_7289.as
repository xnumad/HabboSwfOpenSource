package com.sulake.habbo.communication.messages.outgoing._Str_438
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_7289 implements IMessageComposer 
    {
        private var _array:Array;

        public function _Str_7289(k:String, _arg_2:int=-1, _arg_3:int=-1, _arg_4:int=-1, _arg_5:int=-1, _arg_6:int=-1, _arg_7:int=-1)
        {
            if ((((((_arg_2 == -1) && (_arg_3 == -1)) && (_arg_4 == -1)) && (_arg_5 == -1)) && (_arg_6 == -1)))
            {
                this._array = [k];
            }
            else
            {
                if (_arg_7 == -1)
                {
                    this._array = [k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6];
                }
                else
                {
                    this._array = [k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7];
                }
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
