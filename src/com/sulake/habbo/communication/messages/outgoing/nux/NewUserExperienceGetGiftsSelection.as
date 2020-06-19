package com.sulake.habbo.communication.messages.outgoing.nux
{
    public class NewUserExperienceGetGiftsSelection
    {
        private var _dayIndex:int;
        private var _stepIndex:int;
        private var _giftIndex:int;

        public function NewUserExperienceGetGiftsSelection(k:int, _arg_2:int, _arg_3:int)
        {
            this._dayIndex = k;
            this._stepIndex = _arg_2;
            this._giftIndex = _arg_3;
        }

        public function get dayIndex():int
        {
            return this._dayIndex;
        }

        public function get stepIndex():int
        {
            return this._stepIndex;
        }

        public function get giftIndex():int
        {
            return this._giftIndex;
        }
    }
}
