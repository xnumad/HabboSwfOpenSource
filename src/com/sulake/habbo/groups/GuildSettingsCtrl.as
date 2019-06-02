package com.sulake.habbo.groups
{
    import com.sulake.core.window.components.ISelectorWindow;
    import com.sulake.core.window.components.IRadioButtonWindow;
    import com.sulake.core.window.components.ICheckBoxWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.communication.messages.incoming.users._Str_5716;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class GuildSettingsCtrl 
    {
        public static const _Str_6787:int = 0;
        public static const _Str_6562:int = 1;
        public static const _Str_7780:int = 2;
        public static const _Str_11591:int = 3;
        public static const _Str_8761:int = 4;
        public static const _Str_14996:int = 0;
        public static const _Str_18015:int = 1;

        private var _data:GuildSettingsData;
        private var _guildSelector:ISelectorWindow;
        private var _guildRegular:IRadioButtonWindow;
        private var _guildExclusive:IRadioButtonWindow;
        private var _guildClosed:IRadioButtonWindow;
        private var _membersHaveRights:ICheckBoxWindow;


        public function prepare(k:IWindowContainer):void
        {
            var _local_2:IWindowContainer = (k.findChildByName("step_cont_5") as IWindowContainer);
            this._guildSelector = (_local_2.findChildByName("group_type_selector") as ISelectorWindow);
            this._guildRegular = (_local_2.findChildByName("rb_type_regular") as IRadioButtonWindow);
            this._guildRegular.procedure = this._Str_25413;
            this._guildExclusive = (_local_2.findChildByName("rb_type_exclusive") as IRadioButtonWindow);
            this._guildExclusive.procedure = this._Str_22719;
            this._guildClosed = (_local_2.findChildByName("rb_type_private") as IRadioButtonWindow);
            this._guildClosed.procedure = this._Str_22569;
            this._membersHaveRights = (_local_2.findChildByName("cb_member_rights") as ICheckBoxWindow);
            this._membersHaveRights.procedure = this._Str_25398;
        }

        public function refresh(k:_Str_5716):void
        {
            this._data = new GuildSettingsData(k);
            switch (this._data._Str_4830)
            {
                case _Str_6787:
                    this._guildSelector.setSelected(this._guildRegular);
                    break;
                case _Str_6562:
                    this._guildSelector.setSelected(this._guildExclusive);
                    break;
                case _Str_7780:
                    this._guildSelector.setSelected(this._guildClosed);
                    break;
                default:
                    this._guildSelector.setSelected(this._guildRegular);
            }
            if (this._data._Str_7959 == GuildSettingsCtrl._Str_14996)
            {
                this._membersHaveRights.select();
            }
            else
            {
                this._membersHaveRights.unselect();
            }
            this._guildSelector.invalidate();
        }

        private function _Str_25413(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowEvent.WINDOW_EVENT_SELECT)
            {
                this._data._Str_4830 = _Str_6787;
            }
        }

        private function _Str_22719(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowEvent.WINDOW_EVENT_SELECT)
            {
                this._data._Str_4830 = _Str_6562;
            }
        }

        private function _Str_22569(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowEvent.WINDOW_EVENT_SELECT)
            {
                this._data._Str_4830 = _Str_7780;
            }
        }

        private function _Str_25398(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowEvent.WINDOW_EVENT_SELECT)
            {
                this._data._Str_7959 = GuildSettingsCtrl._Str_14996;
            }
            if (k.type == WindowEvent.WINDOW_EVENT_UNSELECT)
            {
                this._data._Str_7959 = GuildSettingsCtrl._Str_18015;
            }
        }

        public function _Str_15948():void
        {
            if (((!(this._data == null)) && (this._data._Str_22472)))
            {
                this._data._Str_15948();
            }
        }

        public function get _Str_4830():int
        {
            return this._data._Str_4830;
        }

        public function get _Str_7959():int
        {
            return this._data._Str_7959;
        }

        public function get isInitialized():Boolean
        {
            return !(this._data == null);
        }
    }
}

