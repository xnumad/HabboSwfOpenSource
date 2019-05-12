package com.sulake.habbo.navigator
{
    import com.sulake.core.window.components.IDropMenuWindow;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.navigator.domain.Tabs;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class TextSearchInputs 
    {
        private var _navigator:HabboNavigator;
        private var _searchStr:TextFieldManager;
        private var _searchType:IDropMenuWindow;

        public function TextSearchInputs(k:HabboNavigator, _arg_2:IWindowContainer)
        {
            var _local_5:Array;
            super();
            this._navigator = k;
            var _local_3:ITextFieldWindow = ITextFieldWindow(_arg_2.findChildByName("search_str"));
            this._searchStr = new TextFieldManager(this._navigator, _local_3, 35, this._Str_21221, this._navigator.getText("navigator.search.info"));
            Util._Str_3931(_arg_2, "search_but", this._Str_17805);
            var _local_4:Boolean = true;
            if (_local_4)
            {
                this._searchType = (_arg_2.findChildByName("search_type") as IDropMenuWindow);
                _local_5 = new Array();
                _local_5.push(this._navigator.getText("${navigator.navisel.bydefault}"));
                _local_5.push(this._navigator.getText("${navigator.navisel.byowner}"));
                _local_5.push(this._navigator.getText("${navigator.navisel.byroomname}"));
                _local_5.push(this._navigator.getText("${navigator.navisel.bytag}"));
                _local_5.push(this._navigator.getText("${navigator.navisel.bygroupname}"));
                this._searchType.populate(_local_5);
                this._searchType.selection = 0;
            }
        }

        public function dispose():void
        {
            if (this._searchStr)
            {
                this._searchStr.dispose();
                this._searchStr = null;
            }
            this._navigator = null;
        }

        public function _Str_2497(k:String, _arg_2:int):void
        {
            this._searchStr._Str_2497(k);
            if (this._searchType != null)
            {
                switch (_arg_2)
                {
                    case Tabs._Str_5622:
                        this._searchType.selection = 0;
                        return;
                    case Tabs._Str_9661:
                        this._searchType.selection = 1;
                        return;
                    case Tabs._Str_9523:
                        this._searchType.selection = 2;
                        return;
                    case Tabs._Str_5383:
                        this._searchType.selection = 3;
                        return;
                    case Tabs._Str_8671:
                        this._searchType.selection = 4;
                        return;
                }
            }
        }

        private function _Str_17805(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._Str_21221();
        }

        private function _Str_21221():void
        {
            var k:String = this._searchStr.getText();
            if (k == "")
            {
                return;
            }
            if (this._searchType != null)
            {
                switch (this._searchType.selection)
                {
                    case 0:
                        this._navigator._Str_2813._Str_2798(Tabs._Str_3813, Tabs._Str_5622, k);
                        break;
                    case 1:
                        this._navigator._Str_2813._Str_2798(Tabs._Str_3813, Tabs._Str_9661, k);
                        break;
                    case 2:
                        this._navigator._Str_2813._Str_2798(Tabs._Str_3813, Tabs._Str_9523, k);
                        break;
                    case 3:
                        this._navigator._Str_2813._Str_2798(Tabs._Str_3813, Tabs._Str_5383, k);
                        break;
                    case 4:
                        this._navigator._Str_2813._Str_2798(Tabs._Str_3813, Tabs._Str_8671, k);
                        break;
                }
            }
            else
            {
                this._navigator._Str_2813._Str_2798(Tabs._Str_3813, Tabs._Str_5622, k);
            }
            this._navigator._Str_4051("Search", "search", k);
        }

        public function get _Str_17634():TextFieldManager
        {
            return this._searchStr;
        }
    }
}
