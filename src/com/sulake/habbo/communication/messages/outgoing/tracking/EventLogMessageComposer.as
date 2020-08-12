package com.sulake.habbo.communication.messages.outgoing.tracking
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class EventLogMessageComposer implements IMessageComposer 
    {
        private var _category:String;
        private var _type:String;
        private var _action:String;
        private var _extraString:String;
        private var _extraInt:int;

        public function EventLogMessageComposer(category:String, type:String, action:String, extraString:String="", extraInt:int=0)
        {
            this._category = ((category) ? category : "");
            this._type = ((type) ? type : "");
            this._action = ((action) ? action : "");
            this._extraString = ((extraString) ? extraString : "");
            this._extraInt = ((extraInt) ? extraInt : 0);
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._category, this._type, this._action, this._extraString, this._extraInt];
        }
    }
}
