package com.sulake.habbo.navigator.mainview.tabpagedecorators
{
    import com.sulake.habbo.navigator.HabboNavigator;
    import com.sulake.core.window.components.IDropMenuWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2802;
    import com.sulake.habbo.navigator.domain.Tabs;
    import com.sulake.core.window.events.*;

    public class RoomsTabPageDecorator implements ITabPageDecorator 
    {
        private var _navigator:HabboNavigator;
        private var _filter:IDropMenuWindow;
        private var _personalizedRoomsEnabled:Boolean = false;

        public function RoomsTabPageDecorator(k:HabboNavigator)
        {
            this._navigator = k;
        }

        public function _Str_6025(k:IWindowContainer):void
        {
            var _local_2:String = "rooms_header";
            var _local_3:IWindowContainer = (k.getChildByName(_local_2) as IWindowContainer);
            if (((this._filter == null) || (this._filter.disposed)))
            {
                this._filter = IDropMenuWindow(_local_3.findChildByName("roomCtgFilter"));
                this._Str_19000();
                this._filter.addEventListener(WindowEvent.WINDOW_EVENT_SELECTED, this._Str_5118);
            }
            _local_3.visible = true;
        }

        public function _Str_19000():void
        {
            var _local_2:_Str_2802;
            if (((this._filter == null) || (this._filter.disposed)))
            {
                return;
            }
            var k:Array = [this._navigator.getText("navigator.navisel.popularrooms"), this._navigator.getText("navigator.navisel.highestscore")];
            this._personalizedRoomsEnabled = this._navigator.context.configuration.getBoolean("navigator.2014.personalized.navigator");
            if (this._personalizedRoomsEnabled)
            {
                k.push(this._navigator.getText("navigator.navisel.recommendedrooms"));
            }
            for each (_local_2 in this._navigator.data._Str_11717)
            {
                k.push(_local_2._Str_20353);
            }
            this._filter.populate(k);
            this._filter.selection = this._Str_18823;
        }

        private function get _Str_18823():int
        {
            return (this._personalizedRoomsEnabled) ? 2 : 0;
        }

        public function _Str_6883():void
        {
            if (((!(this._filter == null)) && (!(this._filter.disposed))))
            {
                this._filter.removeEventListener(WindowEvent.WINDOW_EVENT_SELECTED, this._Str_5118);
                this._filter.selection = this._Str_18823;
                this._filter.addEventListener(WindowEvent.WINDOW_EVENT_SELECTED, this._Str_5118);
            }
        }

        public function _Str_5920(k:IWindowContainer):void
        {
            this._navigator._Str_7596._Str_21717(k);
        }

        public function _Str_8146():void
        {
            this._Str_2798();
        }

        private function _Str_5118(k:WindowEvent):void
        {
            this._Str_2798();
        }

        private function _Str_2798():void
        {
            var _local_2:int;
            var _local_3:_Str_2802;
            var _local_4:int;
            var k:int = (((this._filter) && (!(this._filter.disposed))) ? this._filter.selection : this._Str_18823);
            Logger.log(("Room filter changed: " + k));
            if (k == 0)
            {
                this._navigator._Str_2813._Str_2798(Tabs._Str_3866, Tabs._Str_5348);
            }
            else
            {
                if (k == 1)
                {
                    this._navigator._Str_2813._Str_2798(Tabs._Str_3866, Tabs._Str_9593);
                }
                else
                {
                    if (((k == 2) && (this._personalizedRoomsEnabled)))
                    {
                        this._navigator._Str_2813._Str_2798(Tabs._Str_3866, Tabs._Str_9699);
                    }
                    else
                    {
                        _local_2 = 2;
                        if (this._personalizedRoomsEnabled)
                        {
                            _local_2++;
                        }
                        _local_3 = this._navigator.data._Str_11717[(k - _local_2)];
                        if (_local_3 == null)
                        {
                            Logger.log(((("No fc found: " + k) + ", ") + this._navigator.data._Str_11717.length));
                            return;
                        }
                        _local_4 = _local_3._Str_4760;
                        Logger.log(("Searching with catId: " + _local_4));
                        this._navigator._Str_2813._Str_2798(Tabs._Str_3866, Tabs._Str_5348, ("" + _local_4));
                    }
                }
            }
            if (((this._filter) && (!(this._filter.disposed))))
            {
                this._navigator._Str_4051(this._filter._Str_4487()[this._filter.selection], "category.view");
            }
        }

        public function get _Str_5960():String
        {
            return ((this._filter) && (!(this._filter.disposed))) ? this._filter._Str_4487()[this._filter.selection] : null;
        }

        public function _Str_8025(k:int):void
        {
        }

        public function _Str_8512(k:String):String
        {
            return k;
        }
    }
}


