package com.sulake.habbo.notifications.singular
{
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.help.IHabboHelp;
    import com.sulake.habbo.window.enum.FrankIllustration;
    import com.sulake.habbo.window.utils._Str_2418;
    import com.sulake.core.window.events.WindowEvent;

    public class HabboAlertDialogManager 
    {
        private var _windowManager:IHabboWindowManager;
        private var _localization:IHabboLocalizationManager;
        private var _habboHelp:IHabboHelp;

        public function HabboAlertDialogManager(k:IHabboWindowManager, _arg_2:IHabboLocalizationManager, _arg_3:IHabboHelp)
        {
            this._windowManager = k;
            this._localization = _arg_2;
            this._habboHelp = _arg_3;
        }

        private static function _Str_4652(k:int):String
        {
            var _local_2:String = ("0" + String(k));
            return _local_2.substr((_local_2.length - 2), _local_2.length);
        }


        public function dispose():void
        {
            this._windowManager = null;
            this._localization = null;
            this._habboHelp = null;
        }

        public function _Str_22425(k:String, _arg_2:String=""):void
        {
            this._Str_16535(k, _arg_2);
        }

        public function _Str_22997(k:String, _arg_2:String=""):void
        {
            this._Str_16535(k, _arg_2, false);
        }

        public function _Str_24335(k:String):void
        {
            this._Str_16535(k, "");
        }

        private function _Str_16535(message:String, url:String, showHabboWay:Boolean=true):void
        {
            var p:RegExp = /\\r/g;
            message = message.replace(p, "\r");
            this._windowManager.simpleAlert("", "${mod.alert.title}", message, "${mod.alert.link}", url, null, FrankIllustration.NEUTRAL, null, function ():void
            {
                if (((!(_habboHelp == null)) && (showHabboWay)))
                {
                    _habboHelp.showHabboWay();
                }
            });
        }

        public function _Str_24270(k:int):void
        {
            this._localization.registerParameter("opening.hours.shutdown", "m", String(k));
            this._windowManager.simpleAlert("", "${opening.hours.title}", "${opening.hours.shutdown}");
        }

        public function _Str_23818(k:int, _arg_2:int):void
        {
            this._localization.registerParameter("maintenance.shutdown", "m", String(k));
            this._localization.registerParameter("maintenance.shutdown", "d", String(_arg_2));
            this._windowManager.simpleAlert("", "${opening.hours.title}", "${maintenance.shutdown}");
        }

        public function _Str_24493(openHour:int, openMinute:int, userThrownOutAtClose:Boolean):void
        {
            if (userThrownOutAtClose)
            {
                this._localization.registerParameter("opening.hours.disconnected", "h", _Str_4652(openHour));
                this._localization.registerParameter("opening.hours.disconnected", "m", _Str_4652(openMinute));
                this._windowManager.alert("${opening.hours.title}", "${opening.hours.disconnected}", 0, function (k:_Str_2418, _arg_2:WindowEvent):void
                {
                    k.dispose();
                });
            }
            else
            {
                this._localization.registerParameter("opening.hours.closed", "h", _Str_4652(openHour));
                this._localization.registerParameter("opening.hours.closed", "m", _Str_4652(openMinute));
                this._windowManager.alert("${opening.hours.title}", "${opening.hours.closed}", 0, function (k:_Str_2418, _arg_2:WindowEvent):void
                {
                    k.dispose();
                });
            }
        }

        public function _Str_24317(openHour:int, openMinute:int):void
        {
            this._localization.registerParameter("opening.hours.disconnected", "h", _Str_4652(openHour));
            this._localization.registerParameter("opening.hours.disconnected", "m", _Str_4652(openMinute));
            this._windowManager.alert("${opening.hours.title}", "${opening.hours.disconnected}", 0, function (k:_Str_2418, _arg_2:WindowEvent):void
            {
                k.dispose();
            });
        }
    }
}
