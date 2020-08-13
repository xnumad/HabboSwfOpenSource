package com.sulake.habbo.communication.messages.outgoing.competition
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class SubmitRoomToCompetitionMessageComposer implements IMessageComposer
    {
        public static const CONFIRM_LEVEL_NOT_ACCEPTED:int = 0;
        public static const CONFIRM_LEVEL_NOT_SUBMITTED:int = 1;
        public static const CONFIRM_LEVEL_NOT_CONFIRMED:int = 2;
        public static const CONFIRM_LEVEL_COMMIT:int = 3;

        private var _data:Array;

        public function SubmitRoomToCompetitionMessageComposer(k:String, _arg_2:int)
        {
            this._data = [];
            super();
            this._data.push(k);
            this._data.push(_arg_2);
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
