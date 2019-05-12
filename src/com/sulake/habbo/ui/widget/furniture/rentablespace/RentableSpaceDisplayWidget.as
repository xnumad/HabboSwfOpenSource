package com.sulake.habbo.ui.widget.furniture.rentablespace
{
    import com.sulake.habbo.ui.widget.ConversionTrackingWidget;
    import flash.utils.Dictionary;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.ui.handler.FurnitureRentableSpaceWidgetHandler;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.utils.FriendlyTime;
    import com.sulake.habbo.session.SecurityLevelEnum;
    import com.sulake.core.window.components.IItemListWindow;

    public class RentableSpaceDisplayWidget extends ConversionTrackingWidget 
    {
        private static var _Str_4003:Dictionary = new Dictionary();

        private var _window:IWindowContainer;
        private var _roomObject:IRoomObject;

        {
            _Str_4003[100] = "${rentablespace.widget.error_reason_already_rented}";
            _Str_4003[101] = "${rentablespace.widget.error_reason_not_rented}";
            _Str_4003[102] = "${rentablespace.widget.error_reason_not_rented_by_you}";
            _Str_4003[103] = "${rentablespace.widget.error_reason_can_rent_only_one_space}";
            _Str_4003[200] = "${rentablespace.widget.error_reason_not_enough_credits}";
            _Str_4003[201] = "${rentablespace.widget.error_reason_not_enough_duckets}";
            _Str_4003[202] = "${rentablespace.widget.error_reason_no_permission}";
            _Str_4003[203] = "${rentablespace.widget.error_reason_no_habboclub}";
            _Str_4003[300] = "${rentablespace.widget.error_reason_disabled}";
            _Str_4003[400] = "${rentablespace.widget.error_reason_generic}";
        }

        public function RentableSpaceDisplayWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary, _arg_4:IHabboLocalizationManager)
        {
            super(k, _arg_2, _arg_3, _arg_4);
            this._Str_2844.widget = this;
        }

        private function get _Str_2844():FurnitureRentableSpaceWidgetHandler
        {
            return _Str_2470 as FurnitureRentableSpaceWidgetHandler;
        }

        public function hide(k:IRoomObject):void
        {
            if (this._roomObject != k)
            {
                return;
            }
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
            this._roomObject = null;
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            }
            this.hide(this._roomObject);
            super.dispose();
        }

        override public function get mainWindow():IWindow
        {
            return this._window;
        }

        public function show(k:IRoomObject):void
        {
            this._roomObject = k;
            this._Str_19184();
        }

        private function createWindow():void
        {
            if (this._window != null)
            {
                return;
            }
            this._window = (windowManager.buildFromXML(XML(assets.getAssetByName("rentablespace_xml").content)) as IWindowContainer);
            this._window.procedure = this._Str_2533;
            this._window.center();
            this._window.findChildByName("rent_button").disable();
            this._window.findChildByName("rented_view").visible = false;
            this._window.findChildByName("error_view").visible = false;
        }

        private function _Str_2533(k:WindowEvent, _arg_2:IWindow):void
        {
            switch (k.type)
            {
                case WindowMouseEvent.CLICK:
                    switch (_arg_2.name)
                    {
                        case "header_button_close":
                        case "error_button_close":
                            this.hide(this._roomObject);
                            break;
                        case "rent_button":
                            this._Str_2844._Str_24022(this._roomObject.getId());
                            break;
                        case "cancel_rent_button":
                            this._Str_2844._Str_24966(this._roomObject.getId());
                            break;
                    }
            }
        }

        public function _Str_19184():void
        {
            if (this._roomObject == null)
            {
                return;
            }
            this._Str_2844._Str_25642(this._roomObject.getId());
        }

        public function _Str_23885(k:Boolean, _arg_2:Boolean, _arg_3:int, _arg_4:int, _arg_5:String, _arg_6:int, _arg_7:int):void
        {
            var _local_8:Boolean;
            if (this._roomObject == null)
            {
                return;
            }
            this.createWindow();
            if (k)
            {
                this._window.findChildByName("rent_view").visible = false;
                this._window.findChildByName("error_view").visible = false;
                this._window.findChildByName("rented_view").visible = true;
                this._window.findChildByName("renter_name").caption = _arg_5;
                this._window.findChildByName("time_remaining_label").caption = FriendlyTime.format(this._Str_2844.container.localization, _arg_6);
                this._window.findChildByName("cancel_rent_button").visible = ((this._Str_2844.container.isOwnerOfFurniture(this._roomObject)) || (this._Str_2844.container.sessionDataManager.hasSecurity(SecurityLevelEnum._Str_3569)));
                IItemListWindow(this._window.findChildByName("rented_view")).arrangeListItems();
            }
            else
            {
                this._window.findChildByName("rented_view").visible = false;
                this._window.findChildByName("error_view").visible = false;
                this._window.findChildByName("rent_view").visible = true;
                this._window.findChildByName("price_label").caption = (_arg_7.toString() + " x");
                _local_8 = (_arg_7 <= this._Str_2844._Str_23322());
                if (!_arg_2)
                {
                    this._window.findChildByName("cant_rent_error").caption = _Str_4003[_arg_3];
                }
                else
                {
                    if (!_local_8)
                    {
                        this._window.findChildByName("cant_rent_error").caption = _Str_4003[200];
                    }
                    else
                    {
                        this._window.findChildByName("cant_rent_error").visible = false;
                        this._window.findChildByName("rent_button").enable();
                    }
                }
                IItemListWindow(this._window.findChildByName("rent_view")).arrangeListItems();
            }
            if (!this._window.visible)
            {
                this._window.visible = true;
            }
        }

        public function _Str_23970(k:int):void
        {
            this._window.findChildByName("rent_view").visible = false;
            this._window.findChildByName("rented_view").visible = false;
            this._window.findChildByName("error_view").visible = true;
            this._window.findChildByName("error_message").caption = _Str_4003[k];
        }
    }
}
