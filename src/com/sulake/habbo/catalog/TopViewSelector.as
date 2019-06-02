package com.sulake.habbo.catalog
{
    import com.sulake.habbo.catalog.navigation.CatalogNavigator;
    import com.sulake.core.window.components.ITabButtonWindow;
    import com.sulake.core.window.components.ITabContextWindow;
    import com.sulake.habbo.catalog.navigation.ICatalogNode;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class TopViewSelector 
    {
        private var _catalog:CatalogNavigator;
        private var _template:ITabButtonWindow;
        private var _tabContext:ITabContextWindow;

        public function TopViewSelector(k:CatalogNavigator, _arg_2:ITabContextWindow)
        {
            this._catalog = k;
            this._tabContext = _arg_2;
            var _local_3:ITabButtonWindow = ITabButtonWindow(_arg_2._Str_3363(0).clone());
            this._template = _local_3;
            this._tabContext._Str_5897(_local_3);
        }

        public function _Str_5377(k:ICatalogNode):void
        {
            var _local_2:ITabButtonWindow = ITabButtonWindow(this._template.clone());
            _local_2.caption = k.localization;
            _local_2.name = k.pageName;
            _local_2.procedure = this._Str_18312;
            this._tabContext._Str_5377(_local_2);
            this._Str_23691();
        }

        private function _Str_23691():void
        {
            var k:int;
            while (k < this._tabContext._Str_4277)
            {
                this._tabContext._Str_3363(k).width = (this._tabContext._Str_3363(k).parent.width / this._tabContext._Str_4277);
                k++;
            }
        }

        public function _Str_17441():void
        {
            while (this._tabContext._Str_4277 > 0)
            {
                this._tabContext._Str_5897(this._tabContext._Str_3363(0));
            }
        }

        public function _Str_12925(k:int):void
        {
            this._tabContext.selector.setSelected(this._tabContext._Str_3363(k));
            this._Str_21480(this._tabContext._Str_3363(k));
        }

        private function _Str_18312(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:ITabButtonWindow;
            if (k.type == WindowMouseEvent.CLICK)
            {
                _local_3 = (_arg_2 as ITabButtonWindow);
                if (_local_3)
                {
                    this._Str_21480(_local_3);
                }
            }
        }

        private function _Str_21480(k:ITabButtonWindow):void
        {
            if (!k)
            {
                return;
            }
            var _local_2:ICatalogNode = this._catalog.getNodeByName(k.name);
            if (_local_2 != null)
            {
                this._catalog._Str_20996(_local_2);
            }
        }
    }
}

