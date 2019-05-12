package com.sulake.habbo.quest.seasonalcalendar
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.quest.HabboQuestEngine;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class RareTeaser implements IDisposable 
    {
        private var _questEngine:HabboQuestEngine;
        private var _window:IWindowContainer;
        private var _unlockDays:Array;
        private var _furniPicks:Array;
        private var _pages:Array;

        public function RareTeaser(k:HabboQuestEngine)
        {
            this._questEngine = k;
        }

        public function dispose():void
        {
            this._questEngine = null;
            this._window = null;
        }

        public function get disposed():Boolean
        {
            return this._questEngine == null;
        }

        public function prepare(k:IFrameWindow):void
        {
            this._unlockDays = this._Str_24095("quests.seasonalcalendar.rareteaser.days");
            this._furniPicks = this._Str_21705("quests.seasonalcalendar.rareteaser.images");
            this._pages = this._Str_21705("quests.seasonalcalendar.rareteaser.pages");
            this._window = IWindowContainer(k.findChildByName("rare_teaser_cont"));
            var _local_2:int = 1;
            while (_local_2 <= this._unlockDays.length)
            {
                this._Str_20885(_local_2).assetUri = ((this._questEngine._Str_3398._Str_13628._Str_22087() + this._furniPicks[(_local_2 - 1)]) + ".png");
                _local_2++;
            }
            this._Str_15018(1).procedure = this._Str_22390;
            this._Str_15018(2).procedure = this._Str_25053;
            this._Str_15018(3).procedure = this._Str_24683;
        }

        private function _Str_24095(k:String):Array
        {
            var _local_5:String;
            var _local_2:String = this._questEngine.localization.getLocalization(k, "");
            var _local_3:Array = _local_2.split(",");
            var _local_4:Array = new Array();
            for each (_local_5 in _local_3)
            {
                if (!isNaN(Number(_local_5)))
                {
                    _local_4.push(int(_local_5));
                }
            }
            return _local_4;
        }

        private function _Str_21705(k:String):Array
        {
            var _local_5:String;
            var _local_2:String = this._questEngine.localization.getLocalization(k, "");
            var _local_3:Array = _local_2.split(",");
            var _local_4:Array = new Array();
            for each (_local_5 in _local_3)
            {
                if (_local_5 != "")
                {
                    _local_4.push(_local_5);
                }
            }
            return _local_4;
        }

        private function _Str_20885(k:int):IStaticBitmapWrapperWindow
        {
            return this._Str_11531(k).findChildByName("furni_pic") as IStaticBitmapWrapperWindow;
        }

        private function _Str_25809(k:int):IWindow
        {
            return this._Str_11531(k).findChildByName("locked_icon");
        }

        private function _Str_25153(k:int):IWindow
        {
            return this._Str_11531(k).findChildByName("locked_bg");
        }

        private function _Str_25052(k:int):IWindow
        {
            return this._Str_11531(k).findChildByName("open_bg");
        }

        private function _Str_15018(k:int):IWindow
        {
            return this._Str_11531(k).findChildByName("click_region");
        }

        private function _Str_11531(k:int):IWindowContainer
        {
            return IWindowContainer(this._window.findChildByName(("rare_cont_" + k)));
        }

        public function refresh():void
        {
            var _local_4:Boolean;
            var k:int = this._questEngine._Str_3398._Str_13628._Str_5472;
            var _local_2:int = -1;
            var _local_3:int = 1;
            while (_local_3 <= this._unlockDays.length)
            {
                _local_4 = (this._unlockDays[(_local_3 - 1)] > k);
                this._Str_20885(_local_3).visible = (!(_local_4));
                this._Str_25809(_local_3).visible = _local_4;
                this._Str_25052(_local_3).visible = (!(_local_4));
                this._Str_25153(_local_3).visible = _local_4;
                this._Str_15018(_local_3).visible = (!(_local_4));
                if (((_local_4) && (_local_2 == -1)))
                {
                    _local_2 = (this._unlockDays[(_local_3 - 1)] - k);
                }
                _local_3++;
            }
            this._window.findChildByName("teaser_info").visible = (!(_local_2 == -1));
            this._questEngine.localization.registerParameter("quests.seasonalcalendar.rareteaser.info", "days", ("" + _local_2));
        }

        private function _Str_22390(k:WindowEvent, _arg_2:IWindow):void
        {
            this._Str_18319(k, 0);
        }

        private function _Str_25053(k:WindowEvent, _arg_2:IWindow):void
        {
            this._Str_18319(k, 1);
        }

        private function _Str_24683(k:WindowEvent, _arg_2:IWindow):void
        {
            this._Str_18319(k, 2);
        }

        private function _Str_18319(k:WindowEvent, _arg_2:int):void
        {
            if (((k.type == WindowMouseEvent.CLICK) && (!(this._pages[_arg_2] == null))))
            {
                this._questEngine.catalog.openCatalogPage(this._pages[_arg_2]);
            }
        }
    }
}
