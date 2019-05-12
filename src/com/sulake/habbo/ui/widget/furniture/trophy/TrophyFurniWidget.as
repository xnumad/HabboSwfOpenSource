package com.sulake.habbo.ui.widget.furniture.trophy
{
    import com.sulake.habbo.ui.widget.ConversionTrackingWidget;
    import com.sulake.core.runtime.IHabboConfigurationManager;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.ui.widget.events._Str_5099;
    import flash.events.IEventDispatcher;

    public class TrophyFurniWidget extends ConversionTrackingWidget implements ITrophyFurniWidget 
    {
        public static const _Str_12649:int = 10;
        public static const _Str_10142:int = 20;

        private var _name:String;
        private var _date:String;
        private var _message:String;
        private var _color:int;
        private var _configuration:IHabboConfigurationManager;
        private var _view:ITrophyView;
        private var _viewType:int;

        public function TrophyFurniWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary, _arg_4:IHabboLocalizationManager, _arg_5:IHabboConfigurationManager)
        {
            super(k, _arg_2, _arg_3, _arg_4);
            this._configuration = _arg_5;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get date():String
        {
            return this._date;
        }

        public function get message():String
        {
            return this._message;
        }

        public function get color():int
        {
            return this._color;
        }

        public function get configuration():IHabboConfigurationManager
        {
            return this._configuration;
        }

        override public function dispose():void
        {
            if (this._view)
            {
                this._view.dispose();
                this._view = null;
            }
            this._configuration = null;
            super.dispose();
        }

        override public function registerUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.addEventListener(_Str_5099.RWTDUE_TROPHY_DATA, this.onObjectUpdate);
            super.registerUpdateEvents(k);
        }

        override public function unregisterUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.removeEventListener(_Str_5099.RWTDUE_TROPHY_DATA, this.onObjectUpdate);
        }

        private function onObjectUpdate(k:_Str_5099):void
        {
            this._name = k.name;
            this._date = k.date;
            this._message = k.message;
            this._color = (k.color - 1);
            this._viewType = k._Str_16299;
            if (((this._color < 0) || (this._color > 2)))
            {
                this._color = 0;
            }
            this._Str_17002();
        }

        private function _Str_17002():void
        {
            if (this._view != null)
            {
                this._view.dispose();
            }
            switch (this._viewType)
            {
                case _Str_10142:
                case _Str_12649:
                    this._view = new NikoTrophyView(this, this._viewType);
                    break;
                default:
                    this._view = new TrophyView(this);
            }
            this._view._Str_3030();
        }
    }
}
