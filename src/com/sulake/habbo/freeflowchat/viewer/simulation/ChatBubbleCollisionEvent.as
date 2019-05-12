package com.sulake.habbo.freeflowchat.viewer.simulation
{
    public class ChatBubbleCollisionEvent 
    {
        private var _first:ChatBubbleSimulationEntity;
        private var _second:ChatBubbleSimulationEntity;

        public function ChatBubbleCollisionEvent(k:ChatBubbleSimulationEntity, _arg_2:ChatBubbleSimulationEntity)
        {
            this._first = k;
            this._second = _arg_2;
        }

        public function get first():ChatBubbleSimulationEntity
        {
            return this._first;
        }

        public function get _Str_6122():ChatBubbleSimulationEntity
        {
            return this._second;
        }

        public function get top():ChatBubbleSimulationEntity
        {
            return (this._first.y < this._second.y) ? this._first : this._second;
        }

        public function get bottom():ChatBubbleSimulationEntity
        {
            return (this._first.y >= this._second.y) ? this._first : this._second;
        }

        public function get left():ChatBubbleSimulationEntity
        {
            return (this._first.x < this._second.x) ? this._first : this._second;
        }

        public function get right():ChatBubbleSimulationEntity
        {
            return (this._first.x >= this._second.x) ? this._first : this._second;
        }

        public function get _Str_21189():Boolean
        {
            return int(this._first.y) == int(this._second.y);
        }

        public function get _Str_14418():ChatBubbleSimulationEntity
        {
            return (this._first.timeStamp < this._second.timeStamp) ? this._first : this._second;
        }
    }
}
