package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class SetMannequinNameComposer implements IMessageComposer
    {
        private var _furniId:int;
        private var _name:String;

        public function SetMannequinNameComposer(k:int, _arg_2:String)
        {
            this._furniId = k;
            this._name = _arg_2;
        }

        public function getMessageArray():Array
        {
            return [this._furniId, this._name];
        }

        public function dispose():void
        {
        }
    }
}
