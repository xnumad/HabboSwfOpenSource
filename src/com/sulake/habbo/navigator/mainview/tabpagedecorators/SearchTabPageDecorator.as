package com.sulake.habbo.navigator.mainview.tabpagedecorators
{
    import com.sulake.habbo.navigator.HabboNavigator;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;

    public class SearchTabPageDecorator implements ITabPageDecorator 
    {
        private var _navigator:HabboNavigator;

        public function SearchTabPageDecorator(k:HabboNavigator)
        {
            this._navigator = k;
        }

        public function _Str_6025(k:IWindowContainer):void
        {
            this._Str_25530(k);
        }

        public function _Str_6883():void
        {
        }

        public function _Str_5920(k:IWindowContainer):void
        {
        }

        public function _Str_8146():void
        {
            this._navigator._Str_2813.open();
        }

        public function get _Str_5960():String
        {
            return null;
        }

        private function _Str_25530(k:IWindowContainer):void
        {
            var _local_2:IWindowContainer = (k.getChildByName("room_competitions_header") as IWindowContainer);
            if (((this._navigator.data == null) || (this._navigator.data._Str_4079 == null)))
            {
                _local_2.visible = false;
                return;
            }
            var _local_3:int = this._navigator.data._Str_4079.pageIndex;
            var _local_4:int = this._navigator.data._Str_4079._Str_8849;
            var _local_5:int = (_local_3 + 1);
            if (_local_4 < 2)
            {
                _local_2.visible = false;
                return;
            }
            _local_2.visible = true;
            this._navigator.registerParameter("navigator.roomcompetitionspager", "page", ("" + _local_5));
            this._navigator.registerParameter("navigator.roomcompetitionspager", "total", ("" + _local_4));
            var _local_6:IWindow = _local_2.findChildByName("next_button");
            var _local_7:IWindow = _local_2.findChildByName("prev_button");
            _local_6.visible = (_local_5 < _local_4);
            _local_7.visible = (_local_5 > 1);
            _local_6.procedure = this._Str_22311;
            _local_7.procedure = this._Str_25590;
        }

        private function _Str_22311(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((k.type == WindowMouseEvent.CLICK) && (!(this._navigator.data._Str_4079 == null))))
            {
                this._navigator.performCompetitionRoomsSearch(this._navigator.data._Str_4079.goalId, (this._navigator.data._Str_4079.pageIndex + 1));
            }
        }

        private function _Str_25590(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((k.type == WindowMouseEvent.CLICK) && (!(this._navigator.data._Str_4079 == null))))
            {
                this._navigator.performCompetitionRoomsSearch(this._navigator.data._Str_4079.goalId, (this._navigator.data._Str_4079.pageIndex - 1));
            }
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
