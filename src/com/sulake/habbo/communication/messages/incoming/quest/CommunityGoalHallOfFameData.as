package com.sulake.habbo.communication.messages.incoming.quest
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CommunityGoalHallOfFameData implements IDisposable 
    {
        private var _goalCode:String;
        private var _hof:Array;

        public function CommunityGoalHallOfFameData(k:IMessageDataWrapper):void
        {
            this._hof = [];
            super();
            this._goalCode = k.readString();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._hof.push(new HallOfFameEntryData(k));
                _local_3++;
            }
        }

        public function dispose():void
        {
            this._hof = null;
        }

        public function get disposed():Boolean
        {
            return this._hof == null;
        }

        public function get hof():Array
        {
            return this._hof;
        }

        public function get goalCode():String
        {
            return this._goalCode;
        }
    }
}
