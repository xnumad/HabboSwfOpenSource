package com.sulake.habbo.quest
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.habbo.quest.seasonalcalendar.MainWindow;
    import com.sulake.habbo.communication.messages.incoming.quest._Str_2455;

    public class QuestController implements IDisposable, IUpdateReceiver 
    {
        private var _questEngine:HabboQuestEngine;
        private var _questsList:QuestsList;
        private var _questDetails:QuestDetails;
        private var _questCompleted:QuestCompleted;
        private var _questTracker:QuestTracker;
        private var _nextQuestTimer:NextQuestTimer;
        private var _seasonalCalendarWindow:MainWindow;

        public function QuestController(k:HabboQuestEngine)
        {
            this._questEngine = k;
            this._questTracker = new QuestTracker(this._questEngine);
            this._questsList = new QuestsList(this._questEngine);
            this._questDetails = new QuestDetails(this._questEngine);
            this._questCompleted = new QuestCompleted(this._questEngine);
            this._nextQuestTimer = new NextQuestTimer(this._questEngine);
            this._seasonalCalendarWindow = new MainWindow(this._questEngine);
        }

        public function onToolbarClick():void
        {
            if (this._questEngine._Str_19304())
            {
                this._seasonalCalendarWindow.onToolbarClick();
                this._questsList.close();
            }
            else
            {
                this._questsList.onToolbarClick();
            }
        }

        public function _Str_4750(k:_Str_2455):void
        {
            this._questTracker._Str_4750(k);
            this._questDetails._Str_4750(k);
            this._questCompleted._Str_4750(k);
            this._nextQuestTimer._Str_4750(k);
        }

        public function _Str_5657(k:_Str_2455, _arg_2:Boolean):void
        {
            this._questTracker._Str_5657(k, _arg_2);
            this._questDetails._Str_5657(k);
            this._questCompleted._Str_5657(k, _arg_2);
        }

        public function _Str_5242():void
        {
            this._questTracker._Str_5242();
            this._questDetails._Str_5242();
            this._questCompleted._Str_5242();
            this._nextQuestTimer._Str_5242();
        }

        public function onCreditBalance():void
        {
            this._questTracker.onCreditBalance();
        }

        public function _Str_2960():void
        {
            this._questsList._Str_2960();
            this._seasonalCalendarWindow._Str_2960();
            this._questTracker._Str_2960();
            this._questDetails._Str_2960();
            this._nextQuestTimer._Str_2960();
        }

        public function update(k:uint):void
        {
            this._questCompleted.update(k);
            this._questTracker.update(k);
            this._nextQuestTimer.update(k);
            this._questsList.update(k);
            this._questDetails.update(k);
            this._seasonalCalendarWindow.update(k);
        }

        public function dispose():void
        {
            this._questEngine = null;
            if (this._questsList)
            {
                this._questsList.dispose();
                this._questsList = null;
            }
            if (this._questTracker)
            {
                this._questTracker.dispose();
                this._questTracker = null;
            }
            if (this._questDetails)
            {
                this._questDetails.dispose();
                this._questDetails = null;
            }
            if (this._questCompleted)
            {
                this._questCompleted.dispose();
                this._questCompleted = null;
            }
            if (this._nextQuestTimer)
            {
                this._nextQuestTimer.dispose();
                this._nextQuestTimer = null;
            }
            if (this._seasonalCalendarWindow)
            {
                this._seasonalCalendarWindow.dispose();
                this._seasonalCalendarWindow = null;
            }
        }

        public function get disposed():Boolean
        {
            return this._questEngine == null;
        }

        public function get _Str_12832():QuestsList
        {
            return this._questsList;
        }

        public function get _Str_11417():QuestDetails
        {
            return this._questDetails;
        }

        public function get _Str_20198():QuestTracker
        {
            return this._questTracker;
        }

        public function get _Str_13628():MainWindow
        {
            return this._seasonalCalendarWindow;
        }

        public function _Str_4970(k:int, _arg_2:int):void
        {
            if (this._seasonalCalendarWindow)
            {
                this._seasonalCalendarWindow._Str_4970(k, _arg_2);
            }
        }
    }
}
