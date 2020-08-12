package com.sulake.habbo.communication.messages.outgoing.newnavigator
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class NavigatorSetSearchCodeViewModeMessageComposer implements IMessageComposer
    {
        private var _Str_2907:Array;

        public function NavigatorSetSearchCodeViewModeMessageComposer(k:String, _arg_2:int)
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
