package com.sulake.habbo.catalog.clubcenter
{
    import com.sulake.habbo.communication.messages.incoming.users.ScrKickbackData;
    import com.sulake.core.window.IWindowContainer;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import flash.events.MouseEvent;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import flash.geom.Point;
    import com.sulake.core.window.components.IBubbleWindow;
    import com.sulake.core.window.components.ITextWindow;

    public class ClubSpecialInfoBubbleView 
    {
        private static const MARGIN:int = 8;

        private var _data:ScrKickbackData;
        private var _controller:HabboClubCenter;
        private var _window:IWindowContainer;
        private var _activateTimer:Timer;

        public function ClubSpecialInfoBubbleView(k:HabboClubCenter, _arg_2:IHabboWindowManager, _arg_3:ScrKickbackData, _arg_4:IWindow):void
        {
            this._data = _arg_3;
            this._controller = k;
            this._window = (_arg_2.buildFromXML(XML(this._controller.assets.getAssetByName("club_center_special_info_xml").content)) as IWindowContainer);
            if (!this._window)
            {
                return;
            }
            this._window.procedure = this.onInput;
            this.positionWindow(_arg_4);
            this.setElementText("info_creditsspent", this.getLocalization("hccenter.breakdown.creditsspent").replace("%credits%", this._data.totalCreditsSpent));
            var _local_5:int = int((this._data.kickbackPercentage * 100));
            this.setElementText("info_factor", this.getLocalization("hccenter.breakdown.paydayfactor").replace("%percent%", _local_5).replace("%multiplier%", this._data.kickbackPercentage));
            _local_5 = int((this._data.kickbackPercentage * 100));
            var _local_6:String = this._controller.localization.getLocalization("hccenter.breakdown.paydayfactor.percent");
            if (((_local_6) && (_local_6.length > 0)))
            {
                _local_6 = _local_6.replace("%percent%", _local_5).replace("%multiplier%", this._data.kickbackPercentage);
            }
            else
            {
                _local_6 = this.getLocalization("hccenter.breakdown.paydayfactor").replace("%percent%", this._data.kickbackPercentage);
            }
            this.setElementText("info_factor", _local_6);
            this.setElementText("info_streakbonus", this.getLocalization("hccenter.breakdown.streakbonus").replace("%credits%", this._data.creditRewardForStreakBonus));
            var _local_7:Number = (int((((this._data.kickbackPercentage * this._data.totalCreditsSpent) + this._data.creditRewardForStreakBonus) * 100)) / 100);
            var _local_8:int = (int(((this._data.creditRewardForMonthlySpent + this._data.creditRewardForStreakBonus) * 100)) / 100);
            this.setElementText("info_total", this.getLocalization("hccenter.breakdown.total").replace("%credits%", _local_8).replace("%actual%", _local_7));
            this._window.activate();
            this._activateTimer = new Timer(80, 1);
            this._activateTimer.addEventListener(TimerEvent.TIMER, this.onTimerEvent);
            this._activateTimer.start();
            if (this._controller.stage)
            {
                this._controller.stage.addEventListener(MouseEvent.CLICK, this.onStageClick);
            }
        }

        private function onTimerEvent(k:TimerEvent):void
        {
            this._activateTimer.stop();
            this._activateTimer.removeEventListener(TimerEvent.TIMER, this.onTimerEvent);
            this._activateTimer = null;
            this._window.activate();
        }

        public function dispose():void
        {
            if (((this._controller) && (this._controller.stage)))
            {
                this._controller.stage.removeEventListener(MouseEvent.CLICK, this.onStageClick);
            }
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
            this._controller = null;
        }

        private function onInput(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((!(k.type == WindowMouseEvent.DOWN)) || (!(this._controller))))
            {
                return;
            }
            k.stopImmediatePropagation();
            switch (_arg_2.name)
            {
                case "special_infolink":
                    this._controller._Str_21087();
                    break;
            }
            this._controller.removeBreakdown();
        }

        private function onStageClick(k:MouseEvent):void
        {
            if (this._controller)
            {
                this._controller.removeBreakdown();
            }
        }

        private function positionWindow(k:IWindow):void
        {
            if (((((!(k)) || (!(this._window))) || (!(this._controller))) || (!(this._controller.stage))))
            {
                return;
            }
            var _local_2:Point = new Point();
            k.getGlobalPosition(_local_2);
            if (((this._controller.stage.stageWidth < (((_local_2.x + k.width) + this._window.width) + MARGIN)) && (_local_2.x > (this._window.width + MARGIN))))
            {
                (this._window as IBubbleWindow).direction = "right";
                _local_2.x = (_local_2.x - (this._window.width + MARGIN));
            }
            else
            {
                _local_2.x = (_local_2.x + (k.width + MARGIN));
            }
            _local_2.y = (_local_2.y + ((k.height * 0.5) - (this._window.height * 0.5)));
            this._window.position = _local_2;
        }

        private function setElementText(k:String, _arg_2:String):void
        {
            if (!this._window)
            {
                return;
            }
            var _local_3:ITextWindow = (this._window.findChildByName(k) as ITextWindow);
            if (_local_3)
            {
                _local_3.text = _arg_2;
            }
        }

        private function getLocalization(k:String):String
        {
            if (((!(this._controller)) || (!(this._controller.localization))))
            {
                return "";
            }
            return this._controller.localization.getLocalization(k, k);
        }
    }
}
