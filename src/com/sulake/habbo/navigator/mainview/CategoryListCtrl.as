package com.sulake.habbo.navigator.mainview
{
    import com.sulake.habbo.navigator.IViewCtrl;
    import com.sulake.habbo.navigator.UserCountRenderer;
    import com.sulake.habbo.navigator.HabboNavigator;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.IScrollbarWindow;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2802;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.navigator.Util;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.navigator.domain.Tabs;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class CategoryListCtrl implements IViewCtrl 
    {
        private static const _Str_7717:int = 5;

        private var _userCountRenderer:UserCountRenderer;
        private var _navigator:HabboNavigator;
        private var _content:IWindowContainer;
        private var _list:IItemListWindow;
        private var _scrollV:IScrollbarWindow;

        public function CategoryListCtrl(k:HabboNavigator)
        {
            this._navigator = k;
            this._userCountRenderer = new UserCountRenderer(this._navigator);
        }

        public function dispose():void
        {
            if (this._userCountRenderer)
            {
                this._userCountRenderer.dispose();
                this._userCountRenderer = null;
            }
        }

        public function refresh():void
        {
            var _local_7:_Str_2802;
            var _local_8:IWindowContainer;
            var _local_9:int;
            var _local_10:int;
            var k:int;
            var _local_2:Array = this._navigator.data.allCategories;
            var _local_3:Map = this._navigator.data._Str_7267.categoryToCurrentUserCountMap;
            var _local_4:Map = this._navigator.data._Str_7267.categoryToMaxUserCountMap;
            var _local_5:IWindowContainer = IWindowContainer(this._list.getListItemAt(0));
            var _local_6:int;
            while (_local_6 < _local_2.length)
            {
                _local_7 = _local_2[_local_6];
                if (_local_7.visible)
                {
                    _local_8 = this.getCategoryContainer(_local_5, _local_6);
                    if (_local_8 == null)
                    {
                        _local_8 = this._Str_9034(_local_6);
                        _local_8.id = _local_6;
                        _local_5.addChild(_local_8);
                    }
                    _local_9 = _local_3.getValue(_local_7._Str_4760);
                    _local_10 = _local_4.getValue(_local_7._Str_4760);
                    this._Str_2966(_local_8, _local_7, _local_9, _local_10);
                    _local_8.y = k;
                    k = (k + (_local_8.height + _Str_7717));
                    _local_8.visible = true;
                    _local_5.height = ((Util._Str_2647(_local_5) > 0) ? (Util._Str_2647(_local_5) + 5) : 0);
                }
                _local_6++;
            }
            if (this._scrollV != null)
            {
                this._scrollV.scrollV = 0;
                this._scrollV.visible = true;
            }
        }

        public function _Str_2966(k:IWindowContainer, _arg_2:_Str_2802, _arg_3:int, _arg_4:int):void
        {
            k.findChildByName("category_name_txt").caption = _arg_2._Str_14718;
            k.findChildByName("arrow_right_icon").visible = true;
            this._userCountRenderer.refreshUserCount(_arg_4, IWindowContainer(k.findChildByName("enter_category_button")), _arg_3, "${navigator.usercounttooltip.users}", 297, 35);
        }

        public function _Str_9034(k:int):IWindowContainer
        {
            var _local_2:IWindowContainer = IWindowContainer(this._navigator.getXmlWindow("grs_category_selector"));
            this._Str_11971(_local_2, k, "enter_category_button", this._Str_16433);
            this._navigator.refreshButton(_local_2, "navi_room_icon", true, null, 0);
            return _local_2;
        }

        private function _Str_16433(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:_Str_2802;
            if (k.type == WindowMouseEvent.CLICK)
            {
                _local_3 = this._navigator.data.allCategories[_arg_2.id];
                this._navigator._Str_2813._Str_2798(Tabs._Str_3866, Tabs._Str_5348, ("" + _local_3._Str_4760));
            }
        }

        private function getCategoryContainer(k:IWindowContainer, _arg_2:int):IWindowContainer
        {
            return IWindowContainer(k.getChildByID(_arg_2));
        }

        private function _Str_11971(k:IWindowContainer, _arg_2:int, _arg_3:String, _arg_4:Function):void
        {
            k.findChildByName(_arg_3).procedure = _arg_4;
            k.findChildByName(_arg_3).id = _arg_2;
        }

        public function set content(k:IWindowContainer):void
        {
            this._content = k;
            this._list = ((this._content) ? IItemListWindow(this._content.findChildByName("item_list_category")) : null);
            this._scrollV = ((this._content) ? IScrollbarWindow(this._content.findChildByName("scroller")) : null);
        }

        public function get content():IWindowContainer
        {
            return this._content;
        }
    }
}
