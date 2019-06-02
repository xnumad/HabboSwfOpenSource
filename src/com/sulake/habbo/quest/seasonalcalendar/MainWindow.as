package com.sulake.habbo.quest.seasonalcalendar
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.quest.HabboQuestEngine;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.habbo.utils._Str_3942;
    import com.sulake.habbo.quest.events.QuestsListEvent;
    import com.sulake.habbo.quest.events.QuestCompletedEvent;
    import com.sulake.habbo.communication.messages.incoming.quest._Str_2455;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class MainWindow implements IDisposable 
    {
        private var _questEngine:HabboQuestEngine;
        private var _window:IFrameWindow;
        private var _toggle:_Str_3942;
        private var _calendar:Calendar;
        private var _catalogPromo:CatalogPromo;
        private var _rareTeaser:RareTeaser;
        private var _seasonalQuestsRequested:Boolean = false;
        private var _currentDay:int;

        public function MainWindow(k:HabboQuestEngine)
        {
            this._questEngine = k;
            this._calendar = new Calendar(this._questEngine, this);
            this._catalogPromo = new CatalogPromo(this._questEngine, this);
            this._rareTeaser = new RareTeaser(this._questEngine);
            this._questEngine.events.addEventListener(QuestsListEvent.QE_QUESTS_SEASONAL, this._Str_12986);
            this._questEngine.events.addEventListener(QuestCompletedEvent.QCE_SEASONAL, this._Str_21252);
        }

        public function dispose():void
        {
            if (this._questEngine)
            {
                this._questEngine.events.removeEventListener(QuestsListEvent.QE_QUESTS_SEASONAL, this._Str_12986);
                this._questEngine.events.removeEventListener(QuestCompletedEvent.QCE_SEASONAL, this._Str_21252);
                this._questEngine = null;
            }
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
            if (this._toggle)
            {
                this._toggle.dispose();
                this._toggle = null;
            }
            if (this._calendar)
            {
                this._calendar.close();
                this._calendar.dispose();
                this._calendar = null;
            }
            if (this._catalogPromo)
            {
                this._catalogPromo.dispose();
                this._catalogPromo = null;
            }
            if (this._rareTeaser)
            {
                this._rareTeaser.dispose();
                this._rareTeaser = null;
            }
        }

        public function get disposed():Boolean
        {
            return this._questEngine == null;
        }

        public function isVisible():Boolean
        {
            return (this._window) && (this._window.visible);
        }

        public function close():void
        {
            if (this._calendar)
            {
                this._calendar.close();
            }
            if (this._window)
            {
                this._window.visible = false;
            }
        }

        public function _Str_2960():void
        {
            this.close();
        }

        public function onToolbarClick():void
        {
            if (!this._window)
            {
                this._questEngine._Str_9649();
                return;
            }
            if (((!(this._toggle)) || (this._toggle.disposed)))
            {
                this._toggle = new _Str_3942(this._window, this._window.desktop, this._questEngine._Str_9649, this.close);
            }
            this._toggle.toggle();
        }

        public function _Str_22087():String
        {
            var k:String = this._questEngine._Str_9628();
            return (this._questEngine.configuration.getProperty("image.library.url") + k) + "_quest_calendar/";
        }

        public function _Str_8212(k:Array, _arg_2:Boolean):void
        {
            if (((!(this.isVisible())) && (!(_arg_2))))
            {
                return;
            }
            this._currentDay = this._Str_22256(k);
            this._calendar._Str_8212(k);
            this.refresh();
            if (_arg_2)
            {
                this._window.visible = true;
                this._window.activate();
            }
        }

        private function _Str_12986(k:QuestsListEvent):void
        {
            this._Str_8212(k.quests, true);
        }

        private function _Str_21252(k:QuestCompletedEvent):void
        {
            this._questEngine._Str_3398._Str_20198._Str_24904();
            this._questEngine._Str_9649();
        }

        public function _Str_4970(k:int, _arg_2:int):void
        {
            this._catalogPromo._Str_4970(k, _arg_2);
        }

        private function _Str_22256(k:Array):int
        {
            var _local_3:_Str_2455;
            var _local_2:int;
            for each (_local_3 in k)
            {
                if (this._questEngine._Str_7575(_local_3))
                {
                    _local_2 = Math.max(_local_2, _local_3.sortOrder);
                }
            }
            return _local_2;
        }

        private function refresh():void
        {
            this._Str_2755();
            this._calendar.refresh();
            this._catalogPromo.refresh();
            this._rareTeaser.refresh();
        }

        private function _Str_2755():void
        {
            if (this._window != null)
            {
                return;
            }
            this._window = IFrameWindow(this._questEngine.getXmlWindow("SeasonalCalendar"));
            var k:* = (("quests." + this._questEngine._Str_9628()) + ".title");
            this._window.caption = this._questEngine.localization.getLocalizationWithParams(k, k);
            this._window.findChildByTag("close").procedure = this._Str_3046;
            this._calendar.prepare(this._window);
            this._catalogPromo.prepare(this._window);
            this._rareTeaser.prepare(this._window);
            this._window.center();
        }

        private function _Str_3046(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this.close();
            }
        }

        public function get _Str_5472():int
        {
            return this._currentDay;
        }

        public function get _Str_26402():CatalogPromo
        {
            return this._catalogPromo;
        }

        public function update(k:uint):void
        {
            if (((((!(this._questEngine.configuration == null)) && (this._questEngine._Str_18128)) && (!(this._seasonalQuestsRequested))) && (this._questEngine._Str_19304())))
            {
                this._questEngine._Str_9649();
                this._seasonalQuestsRequested = true;
            }
        }
    }
}
