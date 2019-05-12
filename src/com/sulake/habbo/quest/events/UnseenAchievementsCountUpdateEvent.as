package com.sulake.habbo.quest.events
{
    import flash.events.Event;

    public class UnseenAchievementsCountUpdateEvent extends Event 
    {
        public static const QE_UACUE:String = "qe_uacue";

        private var _count:int;

        public function UnseenAchievementsCountUpdateEvent(k:int, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(QE_UACUE, _arg_2, _arg_3);
            this._count = k;
        }

        public function get count():int
        {
            return this._count;
        }
    }
}
