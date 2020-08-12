package com.sulake.habbo.communication.messages.outgoing.newnavigator
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class NavigatorRemoveCollapsedCategoryMessageComposer implements IMessageComposer
    {
        private var _Str_2907:Array;

        public function NavigatorRemoveCollapsedCategoryMessageComposer(k:String)
        {
            this._Str_2907 = [];
            super();
            this._Str_2907.push(k);
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
