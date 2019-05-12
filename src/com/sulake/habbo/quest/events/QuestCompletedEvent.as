package com.sulake.habbo.quest.events
{
    import flash.events.Event;
    import com.sulake.habbo.communication.messages.incoming.quest._Str_2455;

    public class QuestCompletedEvent extends Event 
    {
        public static const QCE_SEASONAL:String = "qce_seasonal";

        private var _questData:_Str_2455;

        public function QuestCompletedEvent(k:String, _arg_2:_Str_2455, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(k, _arg_3, _arg_4);
            this._questData = _arg_2;
        }

        public function get _Str_8257():_Str_2455
        {
            return this._questData;
        }
    }
}
