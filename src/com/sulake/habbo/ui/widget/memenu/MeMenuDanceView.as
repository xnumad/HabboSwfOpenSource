package com.sulake.habbo.ui.widget.memenu
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetDanceMessage;
    import com.sulake.habbo.tracking.HabboTracking;

    public class MeMenuDanceView implements IMeMenuView 
    {
        private var _widget:MeMenuWidget;
        private var _window:IWindowContainer;


        public function init(k:MeMenuWidget, _arg_2:String):void
        {
            this._widget = k;
            this.createWindow(_arg_2);
        }

        public function dispose():void
        {
            this._widget = null;
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        public function get window():IWindowContainer
        {
            return this._window;
        }

        private function createWindow(k:String):void
        {
            var _local_4:IItemListWindow;
            var _local_5:XmlAsset;
            var _local_7:int;
            var _local_8:Boolean;
            var _local_9:IWindow;
            var _local_2:XmlAsset = (this._widget.assets.getAssetByName("memenu_dance") as XmlAsset);
            if (_local_2)
            {
                this._window = (this._widget.windowManager.buildFromXML((_local_2.content as XML)) as IWindowContainer);
            }
            if (this._window == null)
            {
                throw (new Error("Failed to construct dance view window from XML!"));
            }
            this._window.name = k;
            var _local_3:Array = [];
            _local_3.push(this._window.findChildByName("stop_dancing_button"));
            _local_3.push(this._window.findChildByName("back_btn"));
            for each (_local_9 in _local_3)
            {
                if (_local_9 == null)
                {
                }
                else
                {
                    _local_9.addEventListener(WindowMouseEvent.CLICK, this._Str_2608);
                }
            }
            _local_4 = (this._window.findChildByName("buttonContainer") as IItemListWindow);
            _local_5 = (this._widget.assets.getAssetByName("memenu_dance_button") as XmlAsset);
            if (_local_4 != null)
            {
                _local_7 = 1;
                while (_local_7 <= 4)
                {
                    _local_8 = false;
                    if (RoomWidgetDanceMessage._Str_17699.indexOf(_local_7) >= 0)
                    {
                        _local_8 = this._widget._Str_24765;
                    }
                    else
                    {
                        _local_8 = true;
                    }
                    if (_local_8)
                    {
                        _local_9 = (this._widget.windowManager.buildFromXML((_local_5.content as XML)) as IWindow);
                        _local_9.name = (("dance_" + _local_7) + "_button");
                        _local_9.caption = (("${widget.memenu.dance" + _local_7) + "}");
                        _local_9.addEventListener(WindowMouseEvent.CLICK, this._Str_2608);
                        _local_4.addListItemAt(_local_9, (_local_4.numListItems - 1));
                        if (this._widget._Str_4878)
                        {
                            _local_9.disable();
                        }
                        else
                        {
                            _local_9.enable();
                        }
                    }
                    _local_7++;
                }
            }
            var _local_6:IWindow = this._window.findChildByName("club_info");
            if (((!(_local_6 == null)) && (this._widget._Str_22242)))
            {
                _local_6.visible = false;
            }
        }

        private function _Str_2608(k:WindowMouseEvent):void
        {
            var _local_3:String;
            var _local_4:Array;
            var _local_5:int;
            var _local_2:IWindow = (k.target as IWindow);
            _local_3 = _local_2.name;
            switch (_local_3)
            {
                case "dance_1_button":
                case "dance_2_button":
                case "dance_3_button":
                case "dance_4_button":
                    _local_4 = _local_3.split("_");
                    _local_5 = parseInt(_local_4[1]);
                    this._widget.messageListener.processWidgetMessage(new RoomWidgetDanceMessage(_local_5));
                    this._widget._Str_4107 = true;
                    this._widget.hide();
                    HabboTracking.getInstance().trackEventLog("MeMenu", "click", "dance_start");
                    return;
                case "stop_dancing_button":
                    this._widget.messageListener.processWidgetMessage(new RoomWidgetDanceMessage(RoomWidgetDanceMessage._Str_13814));
                    this._widget._Str_4107 = false;
                    this._widget.hide();
                    HabboTracking.getInstance().trackEventLog("MeMenu", "click", "dance_stop");
                    return;
                case "back_btn":
                    this._widget._Str_4568(MeMenuWidget.ME_MENU_TOP_VIEW);
                    return;
                default:
                    Logger.log(("Me Menu Dance View: unknown button: " + _local_3));
            }
        }

        public function _Str_6111(k:String, _arg_2:int):void
        {
        }
    }
}
