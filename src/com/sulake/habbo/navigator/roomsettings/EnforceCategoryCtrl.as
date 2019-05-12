package com.sulake.habbo.navigator.roomsettings
{
    import com.sulake.habbo.navigator.IHabboTransitionalNavigator;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.habbo.window.utils._Str_2784;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2802;
    import com.sulake.core.window.components.IDropMenuWindow;
    import com.sulake.habbo.session.SecurityLevelEnum;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.communication.messages.outgoing.roomsettings._Str_11937;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class EnforceCategoryCtrl 
    {
        private var _navigator:IHabboTransitionalNavigator;
        private var _window:IFrameWindow;
        private var _dialog:_Str_2784;
        private var _categorySelection:int = 0;
        private var _tradeModeSelection:int = 0;
        private var _visibleAndSelectableCategories:Array;

        public function EnforceCategoryCtrl(k:IHabboTransitionalNavigator)
        {
            this._visibleAndSelectableCategories = [];
            super();
            this._navigator = k;
        }

        public function show(k:int):void
        {
            var _local_5:_Str_2802;
            var _local_6:Array;
            var _local_7:_Str_2802;
            this.close();
            this._dialog = this._navigator.windowManager.buildModalDialogFromXML((this._navigator.assets.getAssetByName("enforce_category_xml").content as XML));
            this._window = (this._dialog._Str_2429 as IFrameWindow);
            this._window.procedure = this._Str_2533;
            this._window.center();
            this._window.findChildByName("header_button_close").visible = false;
            var _local_2:IDropMenuWindow = (this._window.findChildByName("trade_mode") as IDropMenuWindow);
            var _local_3:Array = new Array();
            _local_3.push("${navigator.roomsettings.trade_not_allowed}");
            _local_3.push("${navigator.roomsettings.trade_not_with_Controller}");
            _local_3.push("${navigator.roomsettings.trade_allowed}");
            _local_2.populate(_local_3);
            _local_2.selection = 0;
            var _local_4:IDropMenuWindow = (this._window.findChildByName("category") as IDropMenuWindow);
            this._visibleAndSelectableCategories = [];
            for each (_local_5 in this._navigator.data._Str_11717)
            {
                if (((!(_local_5._Str_15540)) && ((!(_local_5._Str_13024)) || ((_local_5._Str_13024) && (this._navigator._Str_2627.hasSecurity(SecurityLevelEnum._Str_8629))))))
                {
                    this._visibleAndSelectableCategories.push(_local_5);
                }
            }
            _local_6 = new Array();
            for each (_local_7 in this._visibleAndSelectableCategories)
            {
                _local_6.push(_local_7._Str_14718);
            }
            _local_4.populate(_local_6);
            _local_4.selection = 0;
        }

        private function close():void
        {
            if (((this._dialog) && (this._window)))
            {
                this._dialog.dispose();
                this._dialog = null;
                this._window = null;
            }
        }

        private function _Str_2533(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:int;
            if (k.type == WindowMouseEvent.CLICK)
            {
                switch (_arg_2.name)
                {
                    case "ok":
                        _local_3 = _Str_2802(this._visibleAndSelectableCategories[Math.max(0, this._categorySelection)])._Str_4760;
                        this._navigator.communication.connection.send(new _Str_11937(this._navigator.data._Str_20386, _local_3, this._tradeModeSelection));
                        this.close();
                        break;
                }
            }
            else
            {
                if (k.type == WindowEvent.WINDOW_EVENT_SELECTED)
                {
                    switch (_arg_2.name)
                    {
                        case "category":
                            this._categorySelection = IDropMenuWindow(_arg_2).selection;
                            return;
                        case "trade_mode":
                            this._tradeModeSelection = IDropMenuWindow(_arg_2).selection;
                            return;
                    }
                }
            }
        }
    }
}







