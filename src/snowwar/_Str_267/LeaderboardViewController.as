package snowwar._Str_267
{
	import com.sulake.core.runtime.IDisposable;
	import com.sulake.habbo.localization.IHabboLocalizationManager;
	import com.sulake.habbo.avatar.enum.AvatarSetType;
	import com.sulake.habbo.avatar.enum.AvatarScaleType;
	import com.sulake.habbo.game.WindowUtils;
	import com.sulake.habbo.avatar.IAvatarImageListener;
	import com.sulake.habbo.avatar.IAvatarImage;
	import com.sulake.habbo.communication.messages.parser.game.score._Str_3326;
	import com.sulake.core.assets.IAsset;
	import com.sulake.core.utils.Map;
	import com.sulake.core.window.IWindow;
	import com.sulake.core.window.IWindowContainer;
	import com.sulake.core.window.components.IBitmapWrapperWindow;
	import com.sulake.core.window.components.IItemListWindow;
	import com.sulake.core.window.components.IRegionWindow;
	import com.sulake.core.window.components.ITextWindow;
	import com.sulake.core.window.components.ITextLinkWindow;
	import com.sulake.core.window.events.WindowMouseEvent;
	import flash.display.BitmapData;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import snowwar.SnowWarEngine;

    public class LeaderboardViewController implements IDisposable, IAvatarImageListener 
    {
        private static const _SafeStr_18604:int = 0;
        private static const _SafeStr_18605:int = 1;
        private static const _SafeStr_18606:int = 2;
        private static const _SafeStr_18607:int = 3;

        private var _SafeStr_18579:SnowWarEngine;
        private var _SafeStr_6445:IHabboLocalizationManager;
        private var _SafeStr_9274:IWindowContainer;
        private var _disposed:Boolean;
        private var _SafeStr_5998:int;
        private var _SafeStr_5552:IItemListWindow;
        private var _SafeStr_18608:IWindow;
        private var _SafeStr_18609:ITextLinkWindow;
        private var _SafeStr_18610:IBitmapWrapperWindow;
        private var _SafeStr_18611:ITextWindow;
        private var _SafeStr_18612:IBitmapWrapperWindow;
        private var _SafeStr_18613:ITextWindow;
        private var _SafeStr_18614:IRegionWindow;
        private var _SafeStr_18615:IRegionWindow;
        private var _SafeStr_18616:IRegionWindow;
        private var _SafeStr_18617:IRegionWindow;
        private var _SafeStr_18618:String;
        private var _SafeStr_18619:int;
        private var _SafeStr_18620:Timer;
        private var _SafeStr_18621:Map;
        private var _SafeStr_18622:LeaderboardTable;
        private var _SafeStr_18623:_SafeStr_4664;
        private var _SafeStr_18624:_SafeStr_4665;
        private var _SafeStr_18625:_SafeStr_4663;
        private var _SafeStr_18626:Boolean;
        private var _SafeStr_18482:int = 0;

        public function LeaderboardViewController(k:SnowWarEngine)
        {
            this._SafeStr_18579 = k;
            this._SafeStr_6445 = k.localization;
            this._SafeStr_18621 = new Map();
            this._SafeStr_18626 = this._SafeStr_18579.config.getBoolean("games.highscores.scrolling.enabled");
            this._SafeStr_18622 = new LeaderboardTable(this._SafeStr_18579);
            this._SafeStr_18623 = new _SafeStr_4664(this._SafeStr_18579);
            this._SafeStr_18624 = new _SafeStr_4665(this._SafeStr_18579);
            this._SafeStr_18625 = new _SafeStr_4663(this._SafeStr_18579);
            this._SafeStr_18638();
        }

        public function set _SafeStr_13281(k:int):void
        {
            this._SafeStr_18482 = k;
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            this._SafeStr_18579 = null;
            this._SafeStr_5552 = null;
            this._SafeStr_18608 = null;
            this._SafeStr_18609 = null;
            this._SafeStr_18610 = null;
            this._SafeStr_18611 = null;
            this._SafeStr_18612 = null;
            this._SafeStr_18613 = null;
            this._SafeStr_18614 = null;
            this._SafeStr_18615 = null;
            this._SafeStr_18616 = null;
            this._SafeStr_18617 = null;
            this._SafeStr_18618 = null;
            this._SafeStr_18621.dispose();
            if (this._SafeStr_9274)
            {
                this._SafeStr_9274.dispose();
                this._SafeStr_9274 = null;
            }
            if (this._SafeStr_18622)
            {
                this._SafeStr_18622.dispose();
                this._SafeStr_18622 = null;
            }
            if (this._SafeStr_18623)
            {
                this._SafeStr_18623.dispose();
                this._SafeStr_18623 = null;
            }
            if (this._SafeStr_18624)
            {
                this._SafeStr_18624.dispose();
                this._SafeStr_18624 = null;
            }
            if (this._SafeStr_18625)
            {
                this._SafeStr_18625.dispose();
                this._SafeStr_18625 = null;
            }
            this._SafeStr_18627();
            this._disposed = true;
        }

        private function _SafeStr_18627():void
        {
            if (this._SafeStr_18620 != null)
            {
                this._SafeStr_18620.removeEventListener(TimerEvent.TIMER, this._SafeStr_18589);
                this._SafeStr_18620.stop();
                this._SafeStr_18620 = null;
            }
        }

        private function _SafeStr_18628(k:int):void
        {
            this._SafeStr_18620 = new Timer(60000, k);
            this._SafeStr_18620.addEventListener(TimerEvent.TIMER, this._SafeStr_18589);
            this._SafeStr_18620.start();
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        private function _SafeStr_18629():void
        {
            this._SafeStr_18611.textColor = 0;
            this._SafeStr_18613.textColor = 0xFFFFFF;
            WindowUtils._Str_2972(this._SafeStr_18610, this._SafeStr_12987("left_blue"));
            WindowUtils._Str_2972(this._SafeStr_18612, this._SafeStr_12987("right_black"));
        }

        private function _SafeStr_18630():void
        {
            this._SafeStr_18611.textColor = 0xFFFFFF;
            this._SafeStr_18613.textColor = 0;
            WindowUtils._Str_2972(this._SafeStr_18610, this._SafeStr_12987("left_black"));
            WindowUtils._Str_2972(this._SafeStr_18612, this._SafeStr_12987("right_blue"));
        }

        public function _SafeStr_13282():void
        {
            this._SafeStr_5998 = _SafeStr_18604;
            this._SafeStr_18638();
            this.visible = true;
            this._SafeStr_9274.caption = "${snowwar.leaderboard.friends}";
            this._SafeStr_18609.caption = "${snowwar.leaderboard.all}";
            this._SafeStr_18629();
            this._SafeStr_18652();
            this._SafeStr_18658();
        }

        public function _SafeStr_18631():void
        {
            this._SafeStr_5998 = _SafeStr_18605;
            this._SafeStr_18639();
            this.visible = true;
            this._SafeStr_9274.caption = "${snowwar.leaderboard.all}";
            this._SafeStr_18609.caption = "${snowwar.leaderboard.friends}";
            this._SafeStr_18629();
            this._SafeStr_18652();
            this._SafeStr_18658();
        }

        public function _SafeStr_18632():void
        {
            this._SafeStr_5998 = _SafeStr_18606;
            this._SafeStr_18624.offset = 0;
            this._SafeStr_18640(0);
            this.visible = true;
            this._SafeStr_9274.caption = "${snowwar.leaderboard.all}";
            this._SafeStr_18609.caption = "${snowwar.leaderboard.friends}";
            this._SafeStr_18630();
            this._SafeStr_18652();
            this._SafeStr_18658();
        }

        public function _SafeStr_18633():void
        {
            this._SafeStr_5998 = _SafeStr_18607;
            this._SafeStr_18625.offset = 0;
            this._SafeStr_18641(0);
            this.visible = true;
            this._SafeStr_9274.caption = "${snowwar.leaderboard.friends}";
            this._SafeStr_18609.caption = "${snowwar.leaderboard.all}";
            this._SafeStr_18630();
            this._SafeStr_18652();
            this._SafeStr_18658();
        }

        public function _SafeStr_18634(k:Array, _arg_2:int):void
        {
            this._SafeStr_18623.addEntries(k, _arg_2);
            if (((this._SafeStr_5998 == _SafeStr_18605) && (this.visible)))
            {
                this._SafeStr_18658();
            }
            this._SafeStr_18652();
        }

        public function _SafeStr_18635(k:int, _arg_2:int, _arg_3:Array, _arg_4:int, _arg_5:int, _arg_6:int):void
        {
            this._SafeStr_18627();
            this._SafeStr_18619 = _arg_6;
            this._SafeStr_18618 = ((k + "/") + _arg_2);
            this._SafeStr_18624.maxOffset = _arg_5;
            this._SafeStr_18624.addEntries(_arg_3, _arg_4);
            if (((this._SafeStr_5998 == _SafeStr_18606) && (this.visible)))
            {
                this._SafeStr_18658();
            }
            this._SafeStr_18652();
        }

        public function _SafeStr_18636(k:Array, _arg_2:int):void
        {
            this._SafeStr_18622.addEntries(k, _arg_2);
            if (((this._SafeStr_5998 == _SafeStr_18604) && (this.visible)))
            {
                this._SafeStr_18658();
            }
            this._SafeStr_18652();
        }

        public function _SafeStr_18637(k:int, _arg_2:int, _arg_3:Array, _arg_4:int, _arg_5:int, _arg_6:int):void
        {
            this._SafeStr_18627();
            this._SafeStr_18619 = _arg_6;
            this._SafeStr_18618 = ((k + "/") + _arg_2);
            this._SafeStr_18625.maxOffset = _arg_5;
            this._SafeStr_18625.addEntries(_arg_3, _arg_4);
            if (((this._SafeStr_5998 == _SafeStr_18607) && (this.visible)))
            {
                this._SafeStr_18658();
            }
            this._SafeStr_18652();
        }

        public function hide():void
        {
            this.visible = false;
        }

        public function _Str_840(k:String):void
        {
            if (this._disposed)
            {
                return;
            }
            var _local_2:IBitmapWrapperWindow = this._SafeStr_18621.remove(k);
            if (((_local_2) && (!(_local_2.disposed))))
            {
                this._SafeStr_18526(_local_2, k);
            }
        }

        private function _SafeStr_18638():void
        {
            this._SafeStr_18622._SafeStr_18662(this._SafeStr_18482);
        }

        private function _SafeStr_18639():void
        {
            this._SafeStr_18623._SafeStr_18662(this._SafeStr_18482);
        }

        private function _SafeStr_18640(k:int):void
        {
            this._SafeStr_18624.offset = k;
            this._SafeStr_18624._SafeStr_18662(this._SafeStr_18482);
        }

        private function _SafeStr_18641(k:int):void
        {
            this._SafeStr_18625.offset = k;
            this._SafeStr_18625._SafeStr_18662(this._SafeStr_18482);
        }

        private function get visible():Boolean
        {
            return (this._SafeStr_9274) && (this._SafeStr_9274.visible);
        }

        private function set visible(k:Boolean):void
        {
            if (((k) && (!(this._SafeStr_9274))))
            {
                this._SafeStr_6656();
            }
            if (k)
            {
                this._SafeStr_9274.visible = true;
                this._SafeStr_9274.activate();
            }
            else
            {
                if (this._SafeStr_9274)
                {
                    this._SafeStr_9274.visible = false;
                }
            }
        }

        private function _SafeStr_6656():void
        {
            var k:IWindow;
            var _local_2:IWindow;
            if (!this._SafeStr_9274)
            {
                this._SafeStr_9274 = (WindowUtils.createWindow("snowwar_leaderboard", 1) as IWindowContainer);
                this._SafeStr_9274.center();
                this._SafeStr_9274.findChildByTag("close").addEventListener(WindowMouseEvent.CLICK, this._SafeStr_9859);
                this._SafeStr_5552 = (this._SafeStr_9274.findChildByName("list") as IItemListWindow);
                this._SafeStr_18608 = this._SafeStr_9274.findChildByName("listBorder");
                this._SafeStr_18609 = (this._SafeStr_9274.findChildByName("changeView") as ITextLinkWindow);
                this._SafeStr_18609.addEventListener(WindowMouseEvent.CLICK, this._SafeStr_18642);
                k = this._SafeStr_9274.findChildByName("all_time_region");
                k.addEventListener(WindowMouseEvent.DOWN, this._SafeStr_18643);
                _local_2 = this._SafeStr_9274.findChildByName("this_week_region");
                _local_2.addEventListener(WindowMouseEvent.DOWN, this._SafeStr_18644);
                this._SafeStr_18612 = (this._SafeStr_9274.findChildByName("all_time_image") as IBitmapWrapperWindow);
                this._SafeStr_18610 = (this._SafeStr_9274.findChildByName("this_week_image") as IBitmapWrapperWindow);
                this._SafeStr_18613 = (this._SafeStr_9274.findChildByName("all_time_text") as ITextWindow);
                this._SafeStr_18611 = (this._SafeStr_9274.findChildByName("this_week_text") as ITextWindow);
                this._SafeStr_18614 = (this._SafeStr_9274.findChildByName("scrollUp") as IRegionWindow);
                this._SafeStr_18647(this._SafeStr_18614);
                WindowUtils._Str_2972(this._SafeStr_18614.getChildAt(0), this._SafeStr_12987("scroll_up_normal"));
                this._SafeStr_18615 = (this._SafeStr_9274.findChildByName("scrollDown") as IRegionWindow);
                this._SafeStr_18647(this._SafeStr_18615);
                WindowUtils._Str_2972(this._SafeStr_18615.getChildAt(0), this._SafeStr_12987("scroll_down_normal"));
                this._SafeStr_18616 = (this._SafeStr_9274.findChildByName("nextWeek") as IRegionWindow);
                this._SafeStr_18616.addEventListener(WindowMouseEvent.CLICK, this._SafeStr_18645);
                this._SafeStr_18616.visible = false;
                this._SafeStr_18617 = (this._SafeStr_9274.findChildByName("previousWeek") as IRegionWindow);
                this._SafeStr_18617.addEventListener(WindowMouseEvent.CLICK, this._SafeStr_18646);
                this._SafeStr_18617.visible = false;
                this._SafeStr_18660();
                this._SafeStr_18652();
            }
        }

        private function _SafeStr_18647(k:IWindow):void
        {
            k.addEventListener(WindowMouseEvent.CLICK, this._SafeStr_18648);
            k.addEventListener(WindowMouseEvent.OVER, this._SafeStr_18648);
            k.addEventListener(WindowMouseEvent.OUT, this._SafeStr_18648);
            k.addEventListener(WindowMouseEvent.DOWN, this._SafeStr_18648);
            k.addEventListener(WindowMouseEvent.UP, this._SafeStr_18648);
        }

        private function _SafeStr_9859(k:WindowMouseEvent):void
        {
            this.hide();
        }

        private function _SafeStr_18642(k:WindowMouseEvent):void
        {
            switch (this._SafeStr_5998)
            {
                case _SafeStr_18604:
                    this._SafeStr_18631();
                    return;
                case _SafeStr_18605:
                    this._SafeStr_13282();
                    return;
                case _SafeStr_18606:
                    this._SafeStr_18633();
                    return;
                case _SafeStr_18607:
                    this._SafeStr_18632();
                    return;
            }
        }

        private function _SafeStr_18643(k:WindowMouseEvent):void
        {
            switch (this._SafeStr_5998)
            {
                case _SafeStr_18606:
                    this._SafeStr_18631();
                    return;
                case _SafeStr_18607:
                    this._SafeStr_13282();
                    return;
            }
        }

        private function _SafeStr_18644(k:WindowMouseEvent):void
        {
            switch (this._SafeStr_5998)
            {
                case _SafeStr_18604:
                    this._SafeStr_18633();
                    return;
                case _SafeStr_18605:
                    this._SafeStr_18632();
                    return;
            }
        }

        private function _SafeStr_18649():LeaderboardTable
        {
            var k:LeaderboardTable;
            switch (this._SafeStr_5998)
            {
                case _SafeStr_18604:
                    k = this._SafeStr_18622;
                    break;
                case _SafeStr_18605:
                    k = this._SafeStr_18623;
                    break;
                case _SafeStr_18606:
                    k = this._SafeStr_18624;
                    break;
                case _SafeStr_18607:
                    k = this._SafeStr_18625;
                    break;
                default:
                    HabboGamesCom.log(("Invalid state " + this._SafeStr_5998));
            }
            return k;
        }

        private function _SafeStr_18650():void
        {
            var k:LeaderboardTable = this._SafeStr_18649();
            if (((k) && (k.scrollUp())))
            {
                this._SafeStr_18658();
            }
        }

        private function _SafeStr_18651():void
        {
            var k:LeaderboardTable = this._SafeStr_18649();
            if (((k) && (k.scrollDown())))
            {
                this._SafeStr_18658();
            }
        }

        private function _SafeStr_18648(k:WindowMouseEvent):void
        {
            var _local_3:String;
            var _local_2:String = ((k.window == this._SafeStr_18614) ? "up" : "down");
            switch (k.type)
            {
                case WindowMouseEvent.CLICK:
                    if ((k.window == this._SafeStr_18614))
                    {
                        this._SafeStr_18650();
                    }
                    else
                    {
                        this._SafeStr_18651();
                    }
                    return;
                case WindowMouseEvent.OUT:
                    _local_3 = "normal";
                    break;
                case WindowMouseEvent.OVER:
                    _local_3 = "hilite";
                    break;
                case WindowMouseEvent.DOWN:
                    _local_3 = "click";
                    break;
                case WindowMouseEvent.UP:
                    _local_3 = "normal";
                    break;
            }
            var _local_4:String = ((("scroll_" + _local_2) + "_") + _local_3);
            var _local_5:IWindowContainer = (k.window as IWindowContainer);
            WindowUtils._Str_2972(_local_5.getChildAt(0), this._SafeStr_12987(_local_4));
        }

        private function _SafeStr_18645(k:WindowMouseEvent):void
        {
            if (this._SafeStr_18616.visible)
            {
                switch (this._SafeStr_5998)
                {
                    case _SafeStr_18606:
                        this._SafeStr_18640((this._SafeStr_18624.offset - 1));
                        return;
                    case _SafeStr_18607:
                        this._SafeStr_18641((this._SafeStr_18625.offset - 1));
                        return;
                }
            }
        }

        private function _SafeStr_18646(k:WindowMouseEvent):void
        {
            if (this._SafeStr_18617.visible)
            {
                switch (this._SafeStr_5998)
                {
                    case _SafeStr_18606:
                        this._SafeStr_18640((this._SafeStr_18624.offset + 1));
                        return;
                    case _SafeStr_18607:
                        this._SafeStr_18641((this._SafeStr_18625.offset + 1));
                        return;
                }
            }
        }

        private function _SafeStr_18652():void
        {
            var k:String;
            switch (this._SafeStr_5998)
            {
                case _SafeStr_18606:
                    if (this._SafeStr_18624.offset <= 0)
                    {
                        this._SafeStr_18616.visible = false;
                    }
                    else
                    {
                        this._SafeStr_18616.visible = true;
                    }
                    if (this._SafeStr_18624.offset >= this._SafeStr_18624.maxOffset)
                    {
                        this._SafeStr_18617.visible = false;
                    }
                    else
                    {
                        this._SafeStr_18617.visible = true;
                    }
                    break;
                case _SafeStr_18607:
                    if (this._SafeStr_18625.offset <= 0)
                    {
                        this._SafeStr_18616.visible = false;
                    }
                    else
                    {
                        this._SafeStr_18616.visible = true;
                    }
                    if (this._SafeStr_18625.offset >= this._SafeStr_18625.maxOffset)
                    {
                        this._SafeStr_18617.visible = false;
                    }
                    else
                    {
                        this._SafeStr_18617.visible = true;
                    }
                    break;
                default:
                    this._SafeStr_18616.visible = false;
                    this._SafeStr_18617.visible = false;
            }
            if (this._SafeStr_18616.visible)
            {
                this._SafeStr_18611.caption = this._SafeStr_18618;
            }
            else
            {
                this._SafeStr_18611.caption = "${snowwar.leaderboard.this_week}";
            }
            switch (this._SafeStr_5998)
            {
                case _SafeStr_18606:
                case _SafeStr_18607:
                    if (!this._SafeStr_18616.visible)
                    {
                        this._SafeStr_18653();
                        if (this._SafeStr_18620 == null)
                        {
                            this._SafeStr_18628(this._SafeStr_18619);
                        }
                        return;
                    }
                default:
                    WindowUtils._Str_26294(this._SafeStr_9274, "reset_text");
                    this._SafeStr_18627();
            }
        }

        private function _SafeStr_18653():void
        {
            WindowUtils._Str_26291(this._SafeStr_9274, "reset_text");
            var k:String = "snowwar.leaderboard.weekly_reset";
            var _local_2:int = this._SafeStr_18654(this._SafeStr_18619);
            var _local_3:int = this._SafeStr_18655(this._SafeStr_18619);
            var _local_4:int = this._SafeStr_18656(this._SafeStr_18619);
            this._SafeStr_6445.registerParameter(k, "days", ("" + this._SafeStr_18654(this._SafeStr_18619)));
            this._SafeStr_6445.registerParameter(k, "hours", ("" + this._SafeStr_18655(this._SafeStr_18619)));
            this._SafeStr_6445.registerParameter(k, "minutes", ("" + this._SafeStr_18656(this._SafeStr_18619)));
            WindowUtils._Str_4180(this._SafeStr_9274.findChildByName("reset_text"), (("${" + k) + "}"));
        }

        private function _SafeStr_18589(k:TimerEvent):void
        {
            if (((!(this._SafeStr_18616.visible)) && ((this._SafeStr_5998 == _SafeStr_18606) || (this._SafeStr_5998 == _SafeStr_18607))))
            {
                if (this._SafeStr_18619 > 0)
                {
                    this._SafeStr_18619--;
                }
                this._SafeStr_18653();
            }
        }

        private function _SafeStr_18654(k:int):int
        {
            return Math.floor(((k / 60) / 24));
        }

        private function _SafeStr_18655(k:int):int
        {
            var _local_2:int = this._SafeStr_18654(k);
            return Math.floor(((k - ((_local_2 * 24) * 60)) / 60));
        }

        private function _SafeStr_18656(k:int):int
        {
            var _local_2:int = this._SafeStr_18654(k);
            var _local_3:int = this._SafeStr_18655(k);
            return (k - ((_local_2 * 24) * 60)) - (_local_3 * 60);
        }

        private function _SafeStr_18657():Array
        {
            switch (this._SafeStr_5998)
            {
                case _SafeStr_18604:
                    return this._SafeStr_18622.getVisibleEntries();
                case _SafeStr_18605:
                    return this._SafeStr_18623.getVisibleEntries();
                case _SafeStr_18606:
                    return this._SafeStr_18624.getVisibleEntries();
                case _SafeStr_18607:
                    return this._SafeStr_18625.getVisibleEntries();
                default:
                    return null;
            }
        }

        private function _SafeStr_18658():void
        {
            var _local_5:_Str_3326;
            var _local_6:IWindowContainer;
            var _local_7:IWindowContainer;
            var _local_8:IWindow;
            var _local_9:int;
            var _local_10:IWindowContainer;
            var _local_11:IWindowContainer;
            var k:Array = this._SafeStr_18657();
            var _local_2:int = this._SafeStr_18579.sessionDataManager.userId;
            if (((!(k)) || (k.length == 0)))
            {
                this._SafeStr_5552.visible = false;
                this._SafeStr_18608.visible = false;
                return;
            }
            var _local_3:int;
            this._SafeStr_5552.destroyListItems();
            var _local_4:IWindowContainer = (WindowUtils.createWindow("snowwar_leaderboard_entry") as IWindowContainer);
            while (_local_3 < k.length)
            {
                _local_5 = k[_local_3];
                if (!_local_5)
                {
                }
                else
                {
                    _local_6 = (_local_4.clone() as IWindowContainer);
                    _local_6.findChildByName("rank").caption = _local_5.rank.toString();
                    _local_6.findChildByName("score").caption = _local_5.score.toString();
                    _local_6.findChildByName("name").caption = _local_5.name;
                    this._SafeStr_18526((_local_6.findChildByName("avatarImage") as IBitmapWrapperWindow), _local_5.figure, _local_5.gender);
                    if (((!(_local_5.userId == this._SafeStr_18579.sessionDataManager.userId)) || (((this._SafeStr_5998 == _SafeStr_18605) && (_local_5.userId == _local_2)) && (_local_3 < (k.length - 1)))))
                    {
                        _local_6.findChildByName("highlight").visible = false;
                        _local_6.findChildByName("divider").visible = false;
                        _local_7 = (this._SafeStr_5552.getListItemAt((this._SafeStr_5552.numListItems - 1)) as IWindowContainer);
                        if (_local_7)
                        {
                            _local_7.findChildByName("divider").visible = false;
                        }
                    }
                    _local_6.findChildByName("imageRegion").id = _local_5.userId;
                    _local_6.findChildByName("imageRegion").addEventListener(WindowMouseEvent.CLICK, this._SafeStr_18659);
                    this._SafeStr_5552.addListItem(_local_6);
                }
                _local_3++;
            }
            if (((this._SafeStr_5998 == _SafeStr_18605) || (this._SafeStr_5998 == _SafeStr_18606)))
            {
                if ((_local_3 % this._SafeStr_18622.viewSize) != 0)
                {
                    _local_8 = this._SafeStr_5552.getListItemAt((this._SafeStr_5552.numListItems - 1));
                    _local_9 = 0;
                    while (_local_9 < ((_local_3 % this._SafeStr_18622.viewSize) - 1))
                    {
                        _local_10 = (_local_4.clone() as IWindowContainer);
                        _local_10.findChildByName("rank").caption = "";
                        _local_10.findChildByName("score").caption = "";
                        _local_10.findChildByName("name").caption = "";
                        _local_10.findChildByName("highlight").visible = false;
                        _local_10.findChildByName("divider").visible = false;
                        _local_11 = (this._SafeStr_5552.getListItemAt((this._SafeStr_5552.numListItems - 1)) as IWindowContainer);
                        if (_local_11)
                        {
                            _local_11.findChildByName("divider").visible = false;
                        }
                        _local_10.removeChild(_local_10.findChildByName("imageRegion"));
                        this._SafeStr_5552.addListItem(_local_10);
                        _local_9++;
                    }
                    this._SafeStr_5552.addListItem(_local_8);
                }
            }
            _local_4.dispose();
            _local_4 = (this._SafeStr_5552.getListItemAt((this._SafeStr_5552.numListItems - 1)) as IWindowContainer);
            if (_local_4)
            {
                _local_4.findChildByName("divider").visible = false;
            }
            this._SafeStr_5552.visible = true;
            this._SafeStr_18608.visible = true;
            this._SafeStr_18660();
            this._SafeStr_9274.invalidate();
        }

        private function _SafeStr_18526(k:IBitmapWrapperWindow, _arg_2:String, _arg_3:String=null):void
        {
            var _local_4:BitmapData;
            var _local_5:IAvatarImage = this._SafeStr_18579.avatarRenderManager.createAvatarImage(_arg_2, AvatarScaleType.LARGE, _arg_3, this);
            if (_local_5)
            {
                _local_5.setDirection(AvatarSetType.FULL, 2);
                _local_4 = _local_5._Str_818(AvatarSetType.HEAD);
                if (_local_5.isPlaceholder())
                {
                    this._SafeStr_18621.remove(_arg_2);
                    this._SafeStr_18621.add(_arg_2, k);
                }
                _local_5.dispose();
            }
            WindowUtils._Str_2972(k, _local_4);
            _local_4.dispose();
        }

        private function _SafeStr_18659(k:WindowMouseEvent):void
        {
            this._SafeStr_18579.groupsManager._Str_21987(k.window.id);
        }

        private function _SafeStr_18660():void
        {
            var k:LeaderboardTable = this._SafeStr_18649();
            if (((k) && (this._SafeStr_18626)))
            {
                this._SafeStr_18614.visible = k._SafeStr_18663();
                this._SafeStr_18615.visible = k._SafeStr_18664();
            }
        }

        private function _SafeStr_12987(k:String):BitmapData
        {
            var _local_2:IAsset = this._SafeStr_18579.assets.getAssetByName(k);
            if (_local_2)
            {
                return _local_2.content as BitmapData;
            }
            return null;
        }
    }
}
