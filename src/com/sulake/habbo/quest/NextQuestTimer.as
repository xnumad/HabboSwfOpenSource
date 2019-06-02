package com.sulake.habbo.quest
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.communication.messages.incoming.quest._Str_2455;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.utils.FriendlyTime;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class NextQuestTimer implements IDisposable 
    {
        public static const _Str_10934:int = 1000;
        private static const NEXT_QUEST:String = "next_quest";

        private var _questEngine:HabboQuestEngine;
        private var _quest:_Str_2455;
        private var _window:IWindowContainer;
        private var _expanded:Boolean = false;
        private var _msecsToRefresh:int;

        public function NextQuestTimer(k:HabboQuestEngine)
        {
            this._questEngine = k;
        }

        public function dispose():void
        {
            if (this._questEngine)
            {
                this._questEngine.toolbar.extensionView.detachExtension(NEXT_QUEST);
            }
            this._questEngine = null;
            this._quest = null;
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        public function get disposed():Boolean
        {
            return this._questEngine == null;
        }

        public function _Str_5242():void
        {
            this._quest = null;
            this.close();
        }

        public function _Str_2960():void
        {
            if (((!(this._window == null)) && (this._window.visible)))
            {
                this._window.findChildByName("more_info_region").visible = false;
                this._window.findChildByName("more_info_txt").visible = false;
            }
        }

        public function _Str_4750(k:_Str_2455):void
        {
            if (k._Str_3935 < 1)
            {
                this.close();
                return;
            }
            this._quest = k;
            this._Str_2755();
            this._Str_18138();
            this._window.visible = true;
            this._questEngine.toolbar.extensionView.attachExtension(NEXT_QUEST, this._window);
        }

        private function _Str_2755():void
        {
            if (this._window != null)
            {
                return;
            }
            this._window = IWindowContainer(this._questEngine.getXmlWindow("NextQuestTimer"));
            this._window.x = 0;
            this._window.y = 0;
            this._window.findChildByName("more_info_region").procedure = this._Str_16870;
            this._window.findChildByName("quest_timer_expanded").procedure = this._Str_22120;
            this._window.findChildByName("quest_timer_contracted").procedure = this._Str_22120;
            this._Str_18138();
        }

        private function refresh():void
        {
            var k:int = this._quest._Str_3935;
            if (k < 1)
            {
                this.close();
                this._quest._Str_3935 = 0;
                this._questEngine._Str_3398._Str_4750(this._quest);
            }
            var _local_2:String = FriendlyTime.format(this._questEngine.localization, k);
            var _local_3:* = (this._quest._Str_9246() + ".delayedmsg");
            this._questEngine.localization.registerParameter("quests.nextquesttimer.caption.contracted", "time", _local_2);
            this._questEngine.localization.registerParameter(_local_3, "time", _local_2);
            this._window.findChildByName("quest_header_txt").caption = this._questEngine.localization.getLocalization(("quests.nextquesttimer.caption." + ((this._expanded) ? "expanded" : "contracted")));
            this._window.findChildByName("desc_txt").caption = this._questEngine.localization.getLocalization(_local_3, _local_3);
        }

        private function _Str_18138():void
        {
            this._window.findChildByName("quest_timer_expanded").visible = this._expanded;
            this._window.findChildByName("quest_timer_contracted").visible = (!(this._expanded));
            this._window.findChildByName("more_info_txt").visible = ((this._expanded) && (this._questEngine._Str_6927));
            this._window.findChildByName("more_info_region").visible = ((this._expanded) && (this._questEngine._Str_6927));
            this._window.findChildByName("quest_pic_bitmap").visible = this._expanded;
            this._window.findChildByName("desc_txt").visible = this._expanded;
            this.refresh();
        }

        private function _Str_16870(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._questEngine._Str_3398._Str_11417._Str_5386(this._quest);
            }
        }

        private function _Str_22120(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._expanded = (!(this._expanded));
                this._Str_18138();
            }
        }

        public function update(k:uint):void
        {
            if (((this._window == null) || (!(this._window.visible))))
            {
                return;
            }
            this._msecsToRefresh = (this._msecsToRefresh - k);
            if (this._msecsToRefresh > 0)
            {
                return;
            }
            this._msecsToRefresh = _Str_10934;
            this.refresh();
        }

        private function _Str_14043():int
        {
            return 0;
        }

        public function isVisible():Boolean
        {
            return (this._window) && (this._window.visible);
        }

        public function close():void
        {
            if (((!(this._window == null)) && (this._window.visible)))
            {
                this._window.visible = false;
                this._questEngine.toolbar.extensionView.detachExtension(NEXT_QUEST);
            }
        }

        private function _Str_17891(k:Boolean):void
        {
            this._window.findChildByName("quest_pic_bitmap").visible = k;
        }
    }
}
