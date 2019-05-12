package com.sulake.habbo.toolbar.extensions.purse
{
    import com.sulake.habbo.toolbar.HabboToolbar;
    import com.sulake.habbo.inventory.events.HabboInventoryHabboClubEvent;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.utils.FriendlyTime;
    import com.sulake.core.window.components.IIconWindow;
    import com.sulake.habbo.session.HabboClubLevelEnum;
    import com.sulake.core.window.motion.Motions;
    import com.sulake.core.window.motion.DropBounce;

    public class PurseClubArea extends CurrencyIndicatorBase 
    {
        private static const _Str_3591:uint = 4286084205;
        private static const _Str_3385:uint = 4283781966;
        private static const _Str_5044:int = 13;
        private static const _Str_3830:int = 14;
        private static const _Str_8605:Array = ["toolbar_hc_icon_0", "toolbar_hc_icon_1", "toolbar_hc_icon_2", "toolbar_hc_icon_1", "toolbar_hc_icon_0"];

        private var _clubDays:int = -1;
        private var _toolbar:HabboToolbar;
        private var _clubMinutes:int;

        public function PurseClubArea(k:HabboToolbar, _arg_2:IWindowContainer)
        {
            super(k.windowManager, k.assets);
            this._toolbar = k;
            _window = _arg_2;
            this._Str_19567 = _Str_3591;
            this._Str_21715 = _Str_3385;
            this._Str_15051 = "days";
            this._Str_23355 = _Str_8605;
            this._Str_22454 = 50;
            this._Str_8446 = this._toolbar.localization.getLocalization("purse.clubdays.zero.amount.text", "Get");
            this._Str_5219(new HabboInventoryHabboClubEvent());
        }

        override protected function setAmount(k:int, _arg_2:int=-1):void
        {
            if (k < 1)
            {
                _window.findChildByName("days").visible = false;
                _window.findChildByName("join").visible = true;
                this._Str_15051 = "join";
                this._Str_2497(this._Str_8446);
            }
            else
            {
                _window.findChildByName("days").visible = true;
                _window.findChildByName("join").visible = false;
                this._Str_15051 = "days";
                if (((!(_arg_2 == -1)) && (_arg_2 < (60 * 24))))
                {
                    this._Str_2497(FriendlyTime.shortFormat(this._toolbar.catalog.localization, (_arg_2 * 60)));
                }
                else
                {
                    this._Str_2497(FriendlyTime.shortFormat(this._toolbar.catalog.localization, (k * 86400)));
                }
            }
        }

        private function _Str_5997(k:int):void
        {
            var _local_2:IIconWindow = (_window.findChildByName("club_icon") as IIconWindow);
            if (_local_2)
            {
                _local_2.style = k;
                _local_2.invalidate();
            }
        }

        override public function dispose():void
        {
            this._toolbar = null;
            super.dispose();
        }

        public function _Str_5219(k:HabboInventoryHabboClubEvent=null):void
        {
            var _local_4:IWindowContainer;
            if (!this._toolbar.inventory)
            {
                return;
            }
            var _local_2:int = ((this._toolbar.inventory.clubPeriods * 31) + this._toolbar.inventory.clubDays);
            var _local_3:int = this._toolbar.inventory._Str_6338;
            if (((!(this._clubDays == -1)) && (!(this._toolbar.inventory.clubLevel == HabboClubLevelEnum._Str_3159))))
            {
                this.setAmount(_local_2, _local_3);
                _local_4 = (_window.findChildByName("hc_join_button") as IWindowContainer);
                if (Motions._Str_9810(_local_4) == null)
                {
                    Motions._Str_4598(new DropBounce(_local_4, 900, 16));
                }
            }
            this._clubDays = _local_2;
            this._clubMinutes = _local_3;
            switch (this._toolbar.inventory.clubLevel)
            {
                case HabboClubLevelEnum._Str_3159:
                    this._Str_5997(_Str_3830);
                    _Str_2497(this._Str_8446);
                    return;
                case HabboClubLevelEnum._Str_2964:
                    this._Str_5997(_Str_5044);
                    return;
                case HabboClubLevelEnum._Str_2575:
                    this._Str_5997(_Str_3830);
                    return;
            }
        }
    }
}
